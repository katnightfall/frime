import Modal from "@/components/Modal";
import Header from "./Partials/Header";
import { useEffect, useState } from "react";
import useData from "@/hooks/useData";
import { iRoom } from "@/types/BasicTypes";
import { fetchNui } from "@/utils/fetchNui";
import { formatNumber, getDateTimeDifference, isEnvBrowser } from "@/utils/misc";
import { useVisibility } from "../../hooks/useVisibility";
import classNames from "classnames";
import { useTranslation } from "react-i18next";
import { IoIosArrowBack, IoIosArrowForward } from "react-icons/io";

export const Catalog: React.FC = () => {
  const { t } = useTranslation();
  const { visible, setVisible } = useVisibility();
  const { purchaseApartmentRoom, availableApartmentRooms, availableMloRooms, inMlo, ownedRooms } = useData();
  const [showModal, setShowModal] = useState<boolean>(false);
  const [selectedRoom, setSelectedRoom] = useState<iRoom>({} as iRoom);
  const [selectedDay, setSelectedDay] = useState<number>(0);
  const [_page, setPage] = useState<"catalog" | "owned-rooms">("catalog");

  useEffect(() => {
    if (!visible) return;
    const keyHandler = (e: KeyboardEvent) => {
      if (!isEnvBrowser() && ["Escape"].includes(e.code)) {
        fetchNui("nui:hideFrame", true, true);
        setVisible(false);
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible, setVisible]);

  const handlePurchaseRoom = (e: React.MouseEvent<HTMLButtonElement>) => {
    if (!selectedRoom.room_id) return;
    e.preventDefault();
    purchaseApartmentRoom(selectedRoom.room_id, selectedDay);
    setShowModal(false);
  };

  const handlePreviewRoom = (room: iRoom) => {
    setSelectedRoom(room);
    setShowModal(true);
  };

  const handleSelectDay = (e: React.MouseEvent<HTMLButtonElement>, i: number) => {
    e.preventDefault();
    if (i + 1 == selectedDay) {
      setSelectedDay(0);
    } else setSelectedDay(i + 1);
  };

  return (
    <>
      <div className="w-full h-full px-4 py-4 md:py-8 lg:py-14 md:px-10 lg:px-20 bg-242732/50">
        <div className="flex flex-col max-w-screen-xl mx-auto w-full h-full z-10 relative">
          <Header onClick={() => setPage(_page == "catalog" ? "owned-rooms" : "catalog")} />
          <div className="bg-1E212C mt-4 rounded-lg w-full h-full overflow-auto scrollbar-hide">
            {_page == "catalog" ? (
              <div className="grid lg:grid-cols-2 xl:grid-cols-3 gap-4 p-4">
                {(inMlo ? availableMloRooms : availableApartmentRooms).map((room, i) => (
                  <div key={i} className="relative overflow-hidden bg-242732 rounded-lg">
                    <div
                      className="relative h-[160px] bg-center bg-cover flex items-end"
                      style={{
                        backgroundImage: "url(images/core/inroom.png)",
                      }}
                    >
                      <div
                        className="absolute inset-0"
                        style={{
                          background: "linear-gradient(180deg, rgba(36, 39, 50, 0.5) 50%, #242732 89.39%)",
                        }}
                      ></div>
                      <div className="px-4 mb-4 flex items-center gap-4 relative z-10">
                        <div>
                          <h1 className="font-DMSans font-bold">{room.label}</h1>
                        </div>
                      </div>
                    </div>
                    <div className="px-4 space-y-4 pb-4">
                      <div className="flex items-center justify-between font-DMSans border rounded-md border-white/10 p-3 px-4 bg-[#2b2d38]">
                        <h1 className="text-white text-sm">{t("market_price")}</h1>
                        <div className="flex items-center justify-center gap-2">
                          <h1 className="font-bold text-sm">{formatNumber(room.daily_price.toString())}</h1>
                          <img src="images/icons/coin.svg" alt="icon-coin" />
                        </div>
                      </div>
                      <button onClick={() => handlePreviewRoom(room)} className="bg-5AFFCE/15 border border-5AFFCE w-full p-3 rounded-md hover:bg-5AFFCE/25">
                        <h1 className="text-white font-DMSans font-bold uppercase text-sm">{t("purchase")}</h1>
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <>
                <div className="p-3 flex flex-col gap-3">
                  {ownedRooms.map((room, i) => {
                    const timediff = getDateTimeDifference(room.due_date);
                    const strTimediff = timediff.days + "d" + " " + timediff.hours + "h";
                    return (
                      <div key={i} className="p-2 rounded bg-white/10 border border-white/10 flex items-center gap-2">
                        <div
                          className="w-8 h-8 bg-bottom bg-cover rounded"
                          style={{
                            backgroundImage: 'url("images/core/inroom.png")',
                          }}
                        ></div>
                        <h1 className="text-13">{room?.label},</h1>
                        <h1 className="text-13">Apartment: {room.apartment_id == -1 ? "Mlo Apartment" : room.apartment_id},</h1>
                        <h1 className="text-13">Room: {room.room_id},</h1>
                        <h1 className="text-13">Rental: {room.life_time ? "Life Time" : strTimediff}</h1>
                      </div>
                    );
                  })}
                </div>
              </>
            )}
          </div>
        </div>
      </div>
      <>
        <Modal show={showModal} onClose={() => setShowModal(false)} closeable className="max-w-[460px] px-6 pt-5 pb-2 shadow">
          <>
            <div className="mb-3">
              <h1 className="text-xl font-bold font-DMSans">{t("you_buying_room")}</h1>
              <h1 className="text-5AFFCE font-DMSans">
                {selectedRoom.label} #{selectedRoom.room_id}
              </h1>
            </div>
            <div className="my-3 w-full border rounded-lg border-solid border-white/20 bg-[#2b2d38] p-2">
              <div className="flex justify-between items-center gap-2 px-2">
                <div className="flex gap-1.5 font-bold text-11 text-white pb-2 border-b-2 border-white/35 mt-auto whitespace-nowrap px-1">
                  <h1>{t("rent_daily")}</h1>
                </div>
                <div className="pb-2 border-b-2 border-white/35 w-full mt-auto"></div>
                <div className="flex items-center justify-center mt-auto gap-2">
                  <div className="pb-2 border-b-2 border-white/35 mt-auto flex items-center justify-center px-3">
                    <IoIosArrowBack />
                  </div>
                  <div className="pb-2 border-b-2 border-white/35 mt-auto flex items-center justify-center px-3">
                    <IoIosArrowForward />
                  </div>
                </div>
              </div>
              <div className="px-2 mt-2 grid grid-cols-10 gap-2">
                {[...Array(30)].map((_, i) => {
                  return (
                    <button
                      key={i}
                      onClick={(e) => handleSelectDay(e, i)}
                      className={classNames("w-8 h-6 flex items-center justify-center rounded-sm hover:bg-5AFFCE", {
                        "bg-5AFFCE text-white": selectedDay >= i + 1,
                        "bg-white/15 text-white": selectedDay < i + 1,
                      })}
                    >
                      <h1 className="font-medium">{i + 1}</h1>
                    </button>
                  );
                })}
              </div>
              {selectedDay == 0 && (
                <div className="px-2 mt-2">
                  <h1 className="text-white/50 font-sentic_light text-xs 2k:text-sm">! {t("no_rent")}</h1>
                </div>
              )}
            </div>
            <div className="mb-3 flex justify-between font-DMSans border rounded-md border-white/10 p-3 bg-[#2b2d38]">
              <h1 className="font-medium text-sm">{t("market_price")}</h1>
              <div className="flex items-center gap-2 text-sm">
                <h1 className="font-bold">{selectedDay == 0 ? formatNumber(selectedRoom?.price?.toString()) : formatNumber((selectedRoom?.daily_price * selectedDay).toString())}</h1>
                <img src="images/icons/coin.svg" alt="icon-coin" />
              </div>
            </div>
            <button onClick={handlePurchaseRoom} className="mb-3 bg-5AFFCE/15 border border-5AFFCE w-full p-1.5 rounded-md hover:bg-5AFFCE/25">
              <h1 className="text-white font-DMSans font-bold">{t("purchase")}</h1>
            </button>
            <button onClick={() => setShowModal(false)} className="bg-[#2b2d38] border border-white/10 hover:brightness-110 w-full p-1.5 rounded-md">
              <h1 className="text-white font-DMSans font-bold">{t("cancel")}</h1>
            </button>
          </>
        </Modal>
      </>
    </>
  );
};
