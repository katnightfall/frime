import React, { createContext, useEffect, useState } from "react";
import { DataContextProps } from "@/types/DataProviderTypes";
import {
  FurnitureItemsProps,
  OwnedFurnitureProps,
  WallColorTypes,
  iInRoom,
  iIndicatorSettings,
  iIndicators,
  iRoom,
} from "@/types/BasicTypes";
import { useNuiEvent } from "@/hooks/useNuiEvent";
import { fetchNui } from "@/utils/fetchNui";
import { useTranslation } from "react-i18next";
import "./debug.g";

export const DataCtx = createContext<DataContextProps>({} as DataContextProps);

export const DataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const { i18n } = useTranslation();
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [wallColors, setWallColors] = useState<WallColorTypes[]>([]);
  const [indicatorSettings, setIndicatorSettings] =
    useState<iIndicatorSettings>({} as iIndicatorSettings);
  const [inRoom, setInRoom] = useState<iInRoom>({} as iInRoom);
  const [defaultRooms, setDefaultRooms] = useState<iRoom[]>([]);
  const [soldRooms, setSoldRooms] = useState<iRoom[]>([]);
  const [availableApartmentRooms, setAvailableApartmentRooms] = useState<
    iRoom[]
  >([]);
  const [ownedRooms, setOwnedRooms] = useState<iRoom[]>([]);
  const [furnitureItems, setFurnitureItems] = useState<FurnitureItemsProps>(
    {} as FurnitureItemsProps
  );
  const [ownedFurnitures, setOwnedFurnitures] = useState<OwnedFurnitureProps[]>(
    []
  );
  const [hasDlc, setHasDlc] = useState<{ [key: string]: boolean }>({
    weed: false,
  });

  // Mlo
  const [inMlo, setInMlo] = useState<boolean>(false);
  const [defaultMloRooms, setDefaultMloRooms] = useState<iRoom[]>([]);
  const [soldMloRooms, setSoldMloRooms] = useState<iRoom[]>([]);
  const [availableMloRooms, setAvailableMloRooms] = useState<iRoom[]>([]);

  useEffect(() => {
    const soldRoomIds = soldMloRooms
      .filter((element) => element !== null && element !== undefined)
      .map((room) => room?.room_id);
    const updatedAvailableRooms = defaultMloRooms
      .filter((element) => element !== null && element !== undefined)
      .filter(
        (room) => room && room?.room_id && !soldRoomIds.includes(room.room_id)
      );
    setAvailableMloRooms(updatedAvailableRooms);
  }, [defaultMloRooms, soldMloRooms]);
  useNuiEvent("ui:setMlo", (data: any) => {
    if (data.defaultRooms) {
      setDefaultMloRooms(
        Object.values(data.defaultRooms).filter(
          (element) => element !== null && element !== undefined
        ) as any
      );
    }
    if (data.soldRooms) {
      setSoldMloRooms(
        Object.values(data.soldRooms).filter(
          (element) => element !== null && element !== undefined
        ) as any
      );
    }
  });
  useNuiEvent("ui:setInMlo", setInMlo);
  // end Mlo

  useNuiEvent("ui:setLocale", (data) => {
    i18n.addResourceBundle(data.locale, "translation", data.languages);
  });
  useNuiEvent("ui:setWallColors", setWallColors);
  useNuiEvent("ui:setIndicatorSettings", setIndicatorSettings);
  useNuiEvent("ui:setDefaultRooms", (data: iRoom[]) => {
    data = Object.values(data);
    setDefaultRooms(
      data.filter((element) => element !== null && element !== undefined)
    );
  });
  useNuiEvent("ui:setSoldRooms", (data: iRoom[]) => {
    data = Object.values(data);

    const hasApartmentIdMinusOne = data.some(
      (element) => element.apartment_id === -1
    );

    if (hasApartmentIdMinusOne) {
      setSoldMloRooms(
        data.filter((element) => element !== null && element !== undefined)
      );
    } else {
      setSoldRooms(
        data.filter((element) => element !== null && element !== undefined)
      );
    }
  });

  useNuiEvent("ui:setOwnedRooms", (data) => {
    setOwnedRooms(data);
  });
  useNuiEvent("ui:setFurnitureItems", setFurnitureItems);
  useNuiEvent(
    "ui:setHasDlc",
    (data: { [key: number]: { dlc: string; value: boolean } }) => {
      Object.keys(data).forEach((key) => {
        const item = data[+key];
        setHasDlc((p) => ({
          ...p,
          [item.dlc]: item.value,
        }));
      });
    }
  );

  useNuiEvent("ui:setInRoom", (room: iInRoom) => {
    function setDefaultIndicators(indicators: iIndicators): iIndicators {
      return {
        electricity: indicators?.electricity ?? 0,
        gas: indicators?.gas ?? 0,
        power: indicators?.power ?? 0,
        water: indicators?.water ?? 0,
      };
    }

    if (!room) {
      setInRoom({} as iInRoom);
      return;
    }
    room.indicators = setDefaultIndicators(room.indicators);
    if (room.furnitures) setOwnedFurnitures(room.furnitures);
    setInRoom(room);
  });

  useEffect(() => {
    const soldRoomIds = soldRooms
      .filter((element) => element !== null && element !== undefined)
      .map((room) => room?.room_id);
    const updatedAvailableRooms = defaultRooms
      .filter((element) => element !== null && element !== undefined)
      .filter(
        (room) => room && room?.room_id && !soldRoomIds.includes(room.room_id)
      );
    setAvailableApartmentRooms(updatedAvailableRooms);
  }, [defaultRooms, soldRooms]);

  const purchaseApartmentRoom = async (
    roomId: number,
    day: number
  ): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    const response = await fetchNui(
      "nui:purchaseApartmentRoom",
      {
        roomId: roomId,
        rentDay: day,
      },
      true
    );
    setIsLoading(false);
    return response;
  };

  const updateRoomLights = async (): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    const state =
      typeof inRoom.options.lights == "undefined"
        ? true
        : inRoom.options.lights;
    const response = await fetchNui("nui:updateRoomLights", !state, {
      result: true,
      state: !state,
    });
    if (response.result) {
      setInRoom((p) => ({
        ...p,
        options: {
          ...p.options,
          lights: response.state,
        },
      }));
    }
    setIsLoading(false);
    return response.state;
  };

  const updateWallColor = async (color: number): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    const response = await fetchNui("nui:changeRoomWallColor", color, {
      result: true,
      state: color,
    });
    if (response.result) {
      setInRoom((p) => ({
        ...p,
        options: {
          ...p.options,
          tint: response.state,
        },
      }));
    }
    setIsLoading(false);
    return true;
  };

  const removePermission = async (user: string): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    await fetchNui("nui:removePermission", user, {
      result: true,
      state: user,
    });
    setIsLoading(false);
    return true;
  };

  const addPermission = async (sourceId: number): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    await fetchNui("nui:addPermission", sourceId, {
      result: true,
      state: {
        user: "selim_mes",
        playerName: "Selim Mes",
      },
    });
    setIsLoading(false);
    return true;
  };

  const leaveRoomPermanently = async (): Promise<boolean> => {
    if (isLoading) return true;
    setIsLoading(true);
    await fetchNui("nui:leaveRoomPermanently", null, {
      result: true,
    });
    setIsLoading(false);
    return true;
  };

  const value = {
    defaultRooms,
    wallColors,
    indicatorSettings,
    ownedRooms,
    availableApartmentRooms,
    inRoom,
    furnitureItems,
    ownedFurnitures,
    hasDlc,
    purchaseApartmentRoom,
    updateRoomLights,
    updateWallColor,
    removePermission,
    addPermission,
    leaveRoomPermanently,
    availableMloRooms,
    inMlo,
  };

  return <DataCtx.Provider value={value}>{children}</DataCtx.Provider>;
};
