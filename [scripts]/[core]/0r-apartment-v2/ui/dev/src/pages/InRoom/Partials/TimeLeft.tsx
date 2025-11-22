import useData from "@/hooks/useData";
import { getDateTimeDifference } from "@/utils/misc";
import classNames from "classnames";
import { useTranslation } from "react-i18next";
import { IoInfiniteSharp } from "react-icons/io5";

export const TimeLeft = () => {
  const { t } = useTranslation();
  const { inRoom } = useData();

  const timediff = getDateTimeDifference(inRoom.due_date);
  const strTimediff = timediff.days + "d" + " " + timediff.hours + "h";

  return (
    <div>
      <div className="rounded-[19px] backdrop-blurs flex flex-col my-4">
        <div className="p-2 rounded-[12px] border border-solid border-white/[0.07] bg-1E212C">
          <div className="flex gap-2 items-center">
            <div className="relative flex items-center justify-center">
              <img src="images/icons/hourglass.svg" alt="time" />
            </div>
            <div>
              <h1 className="text-11 font-bold text-white">
                {t("rental_date")}
              </h1>
              <h1 className="text-white/30 text-11 font-medium">
                <span className="mr-1">{t("time")} :</span>
                <span className="font-bold text-[#FF967F]">
                  {inRoom.life_time ? t("life_time") : strTimediff}
                </span>
              </h1>
            </div>
            <div className="ml-auto relative flex items-center justify-center">
              <img src="images/icons/grid_date.svg" alt="grid_date" />
              <h1 className="absolute mt-2 text-[#282E33] text-lg font-bold">
                {inRoom.life_time ? <IoInfiniteSharp /> : timediff.days}
              </h1>
            </div>
          </div>
        </div>
        <div className="w-full flex items-center gap-2 m-auto mt-4">
          <div
            className={classNames("min-w-2 min-h-2 bg-5AFFCE rounded-md", {
              "!bg-[#FD8080]": timediff.days == 0 && !inRoom.life_time,
            })}
          ></div>
          <div
            className={classNames("w-full h-2 bg-5AFFCE rounded-md", {
              "!bg-[#f3505a]": timediff.days == 0 && !inRoom.life_time,
            })}
          ></div>
          <div
            className={classNames("min-w-2 min-h-2 bg-5AFFCE rounded-md", {
              "!bg-[#FD8080]": timediff.days == 0 && !inRoom.life_time,
            })}
          ></div>
          <div
            className={classNames("w-full h-2 bg-5AFFCE rounded-md", {
              "!bg-[#f3505a]": timediff.days == 0 && !inRoom.life_time,
            })}
          ></div>
          <div
            className={classNames("min-w-2 min-h-2 bg-5AFFCE rounded-md", {
              "!bg-[#FD8080]": timediff.days == 0 && !inRoom.life_time,
            })}
          ></div>
        </div>
      </div>
    </div>
  );
};
