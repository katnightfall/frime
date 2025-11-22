import {
  FurnitureItemsProps,
  OwnedFurnitureProps,
  WallColorTypes,
  iInRoom,
  iIndicatorSettings,
  iRoom,
} from "./BasicTypes";

export type DataContextProps = {
  defaultRooms: iRoom[];
  inRoom: iInRoom;
  wallColors: WallColorTypes[];
  indicatorSettings: iIndicatorSettings;
  availableApartmentRooms: iRoom[];
  availableMloRooms: iRoom[];
  inMlo: boolean;
  ownedRooms: iRoom[];
  furnitureItems: FurnitureItemsProps;
  ownedFurnitures: OwnedFurnitureProps[];
  hasDlc: { [key: string]: boolean };
  purchaseApartmentRoom: (roomId: number, rentDay: number) => Promise<boolean>;
  updateRoomLights: () => Promise<boolean>;
  updateWallColor: (color: number) => Promise<boolean>;
  removePermission: (user: string) => Promise<boolean>;
  addPermission: (sourceId: number) => Promise<boolean>;
  leaveRoomPermanently: () => Promise<boolean>;
};
