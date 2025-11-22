import useData from "@/hooks/useData";
import { useTranslation } from "react-i18next";
import { PiUserListLight } from "react-icons/pi";

export default function Header({ onClick }: any) {
  const { t } = useTranslation();
  const { availableApartmentRooms, inMlo, availableMloRooms } = useData();

  return (
    <>
      <div className="rounded-lg bg-1E212C min-h-[132px] max-h-[132px] overflow-hidden">
        <div className="relative flex h-full">
          <div className="relative">
            <div className="absolute">
              <div className="w-40 h-40 -translate-x-1 -translate-y-4 border border-5AE1FF1A rounded-full flex items-center justify-center">
                <div className="w-28 h-28 border border-white rounded-full opacity-30"></div>
              </div>
            </div>
            <img
              className="-translate-x-4 min-w-[180p x] max-w-[180px]"
              src="images/core/building-full.png"
              alt="header-image-building"
            />
          </div>
          <div className="my-auto text-2xl font-bold">
            <h1 className="text-white uppercase font-DMSans font-bold -mb-2">
              {t("buy")}
            </h1>
            <h1 className="uppercase font-DMSans font-bold -mb-2">
              {t("your")}
            </h1>
            <h1 className="uppercase font-DMSans font-bold">
              {t("apart_room")}
            </h1>
          </div>
          <div className="my-auto ml-auto mr-4">
            <div className="flex items-center">
              <div className="flex flex-col items-end mr-9">
                <h1 className="font-DMSans font-medium text-white/60">
                  {t("available_apartment_rooms")}
                </h1>
                <span className="text-white font-bold font-DMSans">
                  {!inMlo
                    ? availableApartmentRooms.length
                    : availableMloRooms.length}
                </span>
              </div>
              <div className="relative flex items-center justify-center">
                <div className="absolute flex items-center justify-center">
                  <div className="w-16 h-16 border rounded-full border-white opacity-30"></div>
                  <div className="absolute w-12 h-12 border rounded-full border-white opacity-80"></div>
                </div>
                <img
                  className="min-w-6 max-w-6"
                  src="images/icons/apartment-building.svg"
                  alt="apartment-building"
                />
              </div>
              <button
                onClick={onClick}
                  className="ml-8 relative flex items-center justify-center border-4 border-double rounded-full border-white/50 p-1.5 text-white"
              >
                <PiUserListLight className="w-6 h-6" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
