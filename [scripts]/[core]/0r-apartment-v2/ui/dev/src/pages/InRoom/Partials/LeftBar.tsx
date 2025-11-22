import Modal from "@/components/Modal";
import useData from "@/hooks/useData";
import { fetchNui } from "@/utils/fetchNui";
import { useState } from "react";
import { useTranslation } from "react-i18next";
import { FaRegLightbulb } from "react-icons/fa";
import { GiSofa } from "react-icons/gi";
import { IoIosArrowDown, IoMdLogOut } from "react-icons/io";
import { BiSolidCctv } from "react-icons/bi";

export const LeftBar = () => {
  const { inRoom, updateRoomLights, wallColors, updateWallColor, leaveRoomPermanently, hasDlc, inMlo } = useData();
  const { t } = useTranslation();

  const [isColorOpen, setColorOpen] = useState<boolean>(false);

  const handleChangeWallColor = async (color: number) => {
    await updateWallColor(color);
  };

  const handleChangeRoomLights = async () => {
    await updateRoomLights();
  };

  const handleLeaveRoomPermanently = async () => {
    if (!inRoom.owner) return;
    await leaveRoomPermanently();
  };

  const handleOpenFurniture = async () => {
    if (!inRoom.owner) return;
    fetchNui("nui:openDecorationMode", null, true);
  };

  const handleOpenCCTV = async () => {
    fetchNui("nui:openCCTV", null, true);
  };

  const handleClickDlcStore = () => {
    const url = "https://store.0resmonstudio.com/";
    window.invokeNative("openUrl", url);
  };

  return (
    <>
      <div className="relative overflow-hidden w-full h-full overflow-y-auto">
        <div className="p-4">
          <h1 className="font-DMSans font-bold text-2xl">
            {t("setup")} {t("your")}
          </h1>
          <h1 className="text-sm text-white/50">{t("apart_room_system")}</h1>
        </div>
        <div className="p-4 flex flex-col gap-4 h-min overflow-y-auto">
          {!inMlo && (
            <>
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-5AE1FF/15 border border-5AFFCE rounded-md flex items-center justify-center">
                  <img className="ml-1 mt-0.5 -rotate-45" src="images/icons/brush.svg" alt="brush" />
                </div>
                <div className="text-sm font-DMSans">
                  <h1 className="text-white font-bold">{t("wall_color")}</h1>
                  <h1 className="text-white/50">{t("customize_your_walls")}</h1>
                </div>
                <button onClick={() => setColorOpen((p) => !p)} className="w-[76px] ml-auto border bg-[#2b2d38] hover:bg-white/15 border-white/15 px-3 py-2 rounded-md">
                  <h1 className="uppercase text-sm font-bold font-DMSans">{t("select")}</h1>
                </button>
              </div>
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-5AE1FF/15 border border-5AFFCE rounded-md flex items-center justify-center">
                  <FaRegLightbulb className="text-white" />
                </div>
                <div className="text-sm font-DMSans">
                  <h1 className="text-white font-bold">{t("lights")}</h1>
                  <h1 className="text-white/50">{t("toggle_lights")}</h1>
                </div>
                <div className="relative w-[76px] ml-auto h-[34px]">
                  <label className="switch w-full cursor-pointer">
                    <input className="w-full" type="checkbox" checked={typeof inRoom?.options?.lights == "undefined" ? true : inRoom?.options.lights} onChange={handleChangeRoomLights} />
                    <>
                      <h1 className="absolute top-1/2 -translate-y-1/2 right-3 text-xs font-medium font-DMSans uppercase">{t("on")}</h1>
                      <h1 className="absolute top-1/2 -translate-y-1/2 left-2 text-xs font-medium font-DMSans uppercase">{t("off")}</h1>
                    </>
                  </label>
                </div>
              </div>
            </>
          )}
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-5AE1FF/15 border border-5AFFCE rounded-md flex items-center justify-center">
              <BiSolidCctv className="text-white" />
            </div>
            <div className="text-sm font-DMSans">
              <h1 className="text-white font-bold">{t("cctv")}</h1>
              <h1 className="text-white/50">{t("desc_cctv")}</h1>
            </div>
            <button onClick={handleOpenCCTV} className="w-[76px] ml-auto border bg-[#2b2d38] hover:bg-white/15 border-white/15 px-3 py-2 rounded-md">
              <h1 className="uppercase text-sm font-bold font-DMSans">{t("select")}</h1>
            </button>
          </div>
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-5AE1FF/15 border border-5AFFCE rounded-md flex items-center justify-center">
              <GiSofa className="text-white" />
            </div>
            <div className="text-sm font-DMSans">
              <h1 className="text-white font-bold">{t("furniture")}</h1>
              <h1 className="text-white/50">{t("customize_your_room")}</h1>
            </div>
            <button onClick={handleOpenFurniture} className="w-[76px] ml-auto border bg-[#2b2d38] hover:bg-white/15 border-white/15 px-3 py-2 rounded-md">
              <h1 className="uppercase text-sm font-bold font-DMSans">{t("select")}</h1>
            </button>
          </div>
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-[#FFD74A]/15 border border-[#FFD74A] rounded-md flex items-center justify-center">
              <img className="ml-0.5 mt-0.5 w-5" src="images/icons/guard-house-dlc.svg" alt="guard-house" />
            </div>
            <div className="text-sm font-DMSans">
              <h1 className="text-[#FFD74A] font-bold">{t("DLC_Weed")}</h1>
              <h1 className="text-white/50">{t("desc_buy_dlc")}</h1>
            </div>
            <div className="relative w-[76px] ml-auto h-[34px]">
              <label className="switch w-full cursor-pointer">
                <input className="w-full dlc" type="checkbox" checked={hasDlc.weed} onClick={!hasDlc.weed ? handleClickDlcStore : () => {}} />
                <>
                  <h1 className="absolute top-1/2 -translate-y-1/2 right-3 text-xs font-medium font-DMSans uppercase">{t("on")}</h1>
                  <h1 className="absolute top-1/2 -translate-y-1/2 left-2 text-xs font-medium font-DMSans uppercase">{t("off")}</h1>
                </>
              </label>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-5AFFCE/30 border border-5AFFCE rounded-md flex items-center justify-center">
              <IoMdLogOut className="w-5 h-5 text-5AFFCE" />
            </div>
            <div className="text-sm font-DMSans">
              <h1 className="text-white font-bold">
                {t("moved_out")} <span className="text-white/50 text-xs font-medium">[{t("double_click")}]</span>
              </h1>
              <h1 className="text-white/50">{t("desc_leave")}</h1>
            </div>
            <button onDoubleClick={handleLeaveRoomPermanently} className="w-[76px] ml-auto border bg-5AFFCE/50 hover:bg-5AFFCE border-white/15 px-3 py-2 rounded-md">
              <h1 className="uppercase text-sm font-bold font-DMSans">{t("out")}</h1>
            </button>
          </div>
        </div>
        <>
          <div className="absolute top-0 right-0 translate-x-1/2 -translate-y-1/2 w-[203px] h-[203px] border border-5AFFCE/10 rounded-full flex items-center justify-center">
            <div className="w-[155px] h-[155px] border border-5AFFCE/30 rounded-full flex items-center justify-center">
              <div
                className="w-[101px] h-[101px] border border-5AFFCE rounded-full opacity-60"
                style={{
                  boxShadow: "0 0 8px 0 #CF4E5B",
                }}
              ></div>
            </div>
          </div>
        </>
        <>
          <Modal key={"color"} show={isColorOpen} closeable onClose={() => setColorOpen(false)} className="max-w-sm !shadow-none !bg-transparent !rounded-none space-y-3">
            <div className="flex items-center gap-3 bg-[#0B0A17] p-3 rounded-lg border border-white/10">
              <div className="w-10 h-10 bg-5AE1FF/15 border border-5AFFCE rounded-md flex items-center justify-center">
                <img className="ml-1 mt-0.5 -rotate-45" src="images/icons/brush.svg" alt="brush" />
              </div>
              <div className="text-sm font-DMSans">
                <h1 className="text-5AFFCE font-bold">{t("wall_color")}</h1>
                <h1 className="text-white/50">{t("customize_your_walls")}</h1>
              </div>
              <IoIosArrowDown className="ml-auto text-white/50 w-5 h-5" />
            </div>
            <div className="flex flex-wrap items-center justify-center gap-3 bg-[#0B0A17] py-4 rounded-lg border border-white/10">
              {wallColors.map((v, k) => (
                <button
                  key={k}
                  className="w-8 h-8 rounded-md"
                  style={{ backgroundColor: v.color }}
                  onClick={() => {
                    handleChangeWallColor(v.id);
                  }}
                ></button>
              ))}
            </div>
          </Modal>
        </>
      </div>
    </>
  );
};
