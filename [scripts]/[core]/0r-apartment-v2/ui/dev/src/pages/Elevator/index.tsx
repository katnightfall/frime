import { useEffect, useState } from "react";
import { fetchNui } from "../../utils/fetchNui";
import { useVisibility } from "../../hooks/useVisibility";
import { useTranslation } from "react-i18next";
import useRouter from "@/hooks/useRouter";

export const Elevator = () => {
  const { t } = useTranslation();
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { visible, setVisible } = useVisibility();
  const { setRouter } = useRouter();
  const [floor, setFloor] = useState<number>(0);

  const handleElevatorMove = async (
    e: React.MouseEvent<HTMLButtonElement>,
    f: number
  ) => {
    e.preventDefault();
    if (isLoading) return;
    setIsLoading(true);
    setFloor(f);
    const result = await fetchNui("nui:elevatorMove", f, true);
    if (result) setIsLoading(false);
  };

  useEffect(() => {
    if (!visible) return;
    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) {
        fetchNui("nui:hideFrame", true, true);
        setVisible(false);
        setRouter("catalog");
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible, setVisible, setRouter]);

  return (
    <div className="w-full h-full bg-black/20">
      <div className="w-full h-full flex items-center justify-end p-20">
        <div className="flex flex-col items-center">
          <div className="p-2 rounded-sm border border-white/40 px-4 bg-black/10">
            <div>
              <h1 className="font-medium text-69E785 drop-shadow-2xl">
                {t("select_floor")}
              </h1>
            </div>
            <div className="mb-1 text-center">
              <h1 className="font-medium">{floor}</h1>
            </div>
            <div className="my-2">
              <div className="flex flex-col items-center justify-center gap-2">
                <button
                  onClick={(e) => handleElevatorMove(e, 0)}
                  className="justify-center border border-white/40 bg-4B/90 px-4 py-2 rounded-sm hover:bg-69E785/50 hover:border-69E785/40"
                >
                  <h1 className="font-medium">Z</h1>
                </button>
                <button
                  onClick={(e) => handleElevatorMove(e, 1)}
                  className="border border-white/40 bg-4B/90 px-4 py-2 rounded-sm hover:bg-69E785/50 hover:border-69E785/40"
                >
                  <h1 className="font-medium">1</h1>
                </button>
                <button
                  onClick={(e) => handleElevatorMove(e, 2)}
                  className="border border-white/40 bg-4B/90 px-4 py-2 rounded-sm hover:bg-69E785/50 hover:border-69E785/40"
                >
                  <h1 className="font-medium">2</h1>
                </button>
                <button
                  onClick={(e) => handleElevatorMove(e, 3)}
                  className="border border-white/40 bg-4B/90 px-4 py-2 rounded-sm hover:bg-69E785/50 hover:border-69E785/40"
                >
                  <h1 className="font-medium">3</h1>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
