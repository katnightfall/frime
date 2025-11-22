import { useEffect, useRef, useState } from "react";
import useData from "../../hooks/useData";
import classNames from "classnames";
import { HiTemplate } from "react-icons/hi";
import { FaPlus } from "react-icons/fa";
import { fetchNui } from "../../utils/fetchNui";
import { FurnitureProps, OwnedFurnitureProps } from "../../types/BasicTypes";
import { FaCircleDollarToSlot } from "react-icons/fa6";
import { LuWarehouse } from "react-icons/lu";
import { PiSelectionForeground } from "react-icons/pi";
import { FaLocationCrosshairs } from "react-icons/fa6";
import { useTranslation } from "react-i18next";
import { useNuiEvent } from "@/hooks/useNuiEvent";

export const Furniture: React.FC = () => {
  const { t } = useTranslation();
  const { furnitureItems, ownedFurnitures } = useData();

  const searchRef = useRef<HTMLInputElement>(null);
  const [o_page, setOPage] = useState<
    "purchase" | "purchase-detail" | "owned" | "owned-detail"
  >("purchase");
  const [subPage, setSubPage] = useState<"category" | "items">("category");
  const [selectedCategory, setSelectedCategory] = useState<string>();
  const [searchAny, setSearchAny] = useState<string | null>(null);

  const [ownedDetail, setOwnedDetail] = useState<OwnedFurnitureProps | null>(
    null
  );

  const [purchaseDetail, setPD] = useState<FurnitureProps | undefined>(
    undefined
  );

  useEffect(() => {
    const handleKeyPress = (event: KeyboardEvent) => {
      if (event.key === "CapsLock") {
        fetchNui("nui:setNuiFocusToFalse");
      }
    };
    document.addEventListener("keydown", handleKeyPress);
    return () => {
      document.removeEventListener("keydown", handleKeyPress);
    };
  }, []);

  useEffect(() => {
    setOwnedDetail(null);
  }, [ownedFurnitures]);

  useNuiEvent("ui:furniture:setPD", (data) => {
    let d = data;
    if (!d) {
      d = undefined;
    }
    setPD(d);
    if (!d) {
      setOPage("purchase");
    }
  });

  const handleClickOwnedFurniture = (
    e: React.MouseEvent<HTMLButtonElement>,
    f: OwnedFurnitureProps
  ) => {
    e.preventDefault();
    setOwnedDetail(f);
    setOPage("owned-detail");
  };

  const handleGoBackOwned = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    setOPage("owned");
    setOwnedDetail(null);
  };
  const handleGoBackPurchase = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    setOPage("purchase");
    setPD(undefined);
    fetchNui("nui:furniture:clearpreview", true, true);
  };

  const handleSelectCategory = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    setSearchAny(null);
    if (searchRef.current) searchRef.current.value = "";
    setSelectedCategory(e.currentTarget.getAttribute("data-category") || "");
    setSubPage("items");
  };

  const handleGoBackCategories = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    setSearchAny(null);
    if (searchRef.current) searchRef.current.value = "";
    setSubPage("category");
    setSelectedCategory("");
  };

  const handleSaveButton = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    fetchNui("nui:closeDecorationMode", null, true);
  };

  const handleSearchInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const input = e.currentTarget;
    const value = input.value.trim();
    if (value.length > 0) {
      setSearchAny(value);
    } else {
      setSearchAny(null);
    }
  };

  const handlePreviewFurniture = async (
    e: React.MouseEvent<HTMLButtonElement>,
    furniture: FurnitureProps
  ) => {
    e.preventDefault();
    if (!selectedCategory) return;
    setPD(furniture);
    setOPage("purchase-detail");
    await fetchNui(
      "nui:previewFurniture",
      {
        furniture: furniture,
        category: selectedCategory,
      },
      true
    );
  };

  const handleOwnedFurniturePlaceGround = async (
    e: React.MouseEvent<HTMLButtonElement>
  ) => {
    e.preventDefault();
    setOPage("owned");
    if (!ownedDetail) return;
    let category;
    for (const key in furnitureItems) {
      const items = furnitureItems[key].items;
      for (const item of items) {
        if (item.model === ownedDetail.model) {
          category = key;
          break;
        }
      }
      if (category) {
        break;
      }
    }
    if (!category) return;
    await fetchNui("nui:ownedFurniturePlaceGround", {
      furniture: ownedDetail,
      selectedCategory: category,
    });
    setOwnedDetail(null);
  };

  const handleOwnedFurnitureReSell = async (
    e: React.MouseEvent<HTMLButtonElement>
  ) => {
    e.preventDefault();
    setOPage("owned");
    if (!ownedDetail) return;
    await fetchNui("nui:ownedFurnitureReSell", ownedDetail);
    setOwnedDetail(null);
  };

  const handleOwnedFurniturePutInStorage = async (
    e: React.MouseEvent<HTMLButtonElement>
  ) => {
    e.preventDefault();
    setOPage("owned");
    if (!ownedDetail) return;
    await fetchNui("nui:ownedFurniturePutInStorage", ownedDetail);
    setOwnedDetail(null);
  };

  const handleOwnedFurnitureEdit = async (
    e: React.MouseEvent<HTMLButtonElement>
  ) => {
    e.preventDefault();
    setOPage("owned");
    if (!ownedDetail) return;
    let category;
    for (const key in furnitureItems) {
      const items = furnitureItems[key].items;
      for (const item of items) {
        if (item.model === ownedDetail.model) {
          category = key;
          break;
        }
      }
      if (category) {
        break;
      }
    }
    if (!category) return;
    await fetchNui("nui:ownedFurnitureEdit", {
      furniture: ownedDetail,
      selectedCategory: category,
    });
    setOwnedDetail(null);
  };

  const priorityCategories = [
    "stashes",
    "wardrobe",
    "weed_planter",
    "weed_dryer",
    "weed_heather",
    "weed_light",
    "weed_fans",
    "weed_table",
  ];

  return (
    <div
      className="absolute inset-0 pt-10 px-10 pb-4 z-[999] select-none"
      style={{
        background:
          "radial-gradient(circle, rgba(255,255,255,0) 28%, rgba(0,0,0,0.4542191876750701) 75%)",
      }}
    >
      <div className="relative w-full h-full">
        <div
          className="w-full absolute bg-cover h-10"
          style={{ backgroundImage: "url(images/furniture/celtik_2.png)" }}
        ></div>
        <div className="h-[3px] bg-white rounded w-[160px] mx-auto select-none z-0"></div>
        <div className="flex items-center justify-center gap-2 mt-2 z-50 relative">
          <button
            onClick={handleSaveButton}
            className="py-2 px-4 rounded border border-solid border-white/[0.07] bg-[#282828]/80 text-white/90 hover:text-white"
          >
            <h1 className="font-bold text-xs">{t("lFurniture.save")}</h1>
          </button>
        </div>
        <div className="w-full flex justify-between h-full">
          <div className="w-[260px] -ml-3.5 flex flex-col pb-32">
            <div className="flex gap-2">
              <div className="relative flex items-center justify-center">
                <img
                  src="images/icons/furniture/ellipse_1.svg"
                  alt="ellipse_1"
                />
                <div className="absolute flex items-center justify-center">
                  <img
                    src="images/icons/furniture/polygon_3.svg"
                    alt="polgon_3"
                  />
                </div>
              </div>
              <div>
                <h1 className="text-13 font-bold">
                  {t("lFurniture.furniture_list")}
                </h1>
                <h1 className="text-11 font-medium text-white/50">
                  {t("lFurniture.desc_furniture_list")}
                </h1>
              </div>
            </div>
            <div className="mt-3 relative flex items-center">
              <input
                ref={searchRef}
                onChange={handleSearchInputChange}
                type="text"
                placeholder={t("lFurniture.input_search")}
                className="w-full p-1.5 rounded border bg-[#282828]/90 border-white/[0.07] ring-0 outline-none text-white/50 text-13 pr-8"
              />
              <img
                className="absolute right-2 w-4"
                src="images/icons/furniture/search.svg"
                alt="search"
              />
            </div>
            <div className="mt-3 flex gap-3 justify-between">
              <button
                onClick={() => setOPage("purchase")}
                className={classNames(
                  "w-full bg-[#282828]/90 p-1.5 rounded border border-white/[0.07] hover:bg-[#4B4B4B]",
                  { "!bg-[#4B4B4B]": o_page == "purchase" }
                )}
              >
                <h1 className="text-sm font-medium">
                  {t("lFurniture.purchase")}
                </h1>
              </button>
              <button
                onClick={() => setOPage("owned")}
                className={classNames(
                  "w-full bg-[#282828]/90 p-1.5 rounded border border-white/[0.07] hover:bg-[#4B4B4B]",
                  { "!bg-[#4B4B4B]": o_page == "owned" }
                )}
              >
                <h1 className="text-sm font-medium">{t("lFurniture.owned")}</h1>
              </button>
            </div>
            <div className="mt-3 flex flex-col gap-1.5 overflow-y-auto pr-1 -mr-1">
              <>
                {o_page == "purchase" && (
                  <>
                    {subPage == "category" &&
                      Object.keys(furnitureItems)
                        .sort((a, b) => {
                          const aIsPriority = priorityCategories.includes(a);
                          const bIsPriority = priorityCategories.includes(b);

                          if (aIsPriority && bIsPriority) {
                            return (
                              priorityCategories.indexOf(a) -
                              priorityCategories.indexOf(b)
                            );
                          }
                          if (aIsPriority) return -1;
                          if (bIsPriority) return 1;
                          return a.localeCompare(b);
                        })
                        .filter((key) => {
                          const value = furnitureItems[key];
                          return value.label
                            .toLowerCase()
                            .includes(searchAny?.toLowerCase() ?? "");
                        })
                        .map((key, i) => {
                          const category = furnitureItems[key];
                          return (
                            <button
                              key={i}
                              data-category={key}
                              onClick={handleSelectCategory}
                              className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1"
                            >
                              <img
                                src={`images/icons/furniture/folder_${
                                  (i % 8) + 1
                                }.png`}
                                alt="folder"
                              />
                              <h1 className="text-13 font-medium first-letter:uppercase">
                                {category.label}
                              </h1>
                              <img
                                className="ml-auto rotate-180"
                                src="images/icons/furniture/arr_left.svg"
                                alt="arr_left"
                              />
                            </button>
                          );
                        })}
                    {subPage == "items" && selectedCategory && (
                      <>
                        <button
                          onClick={handleGoBackCategories}
                          className="cursor-pointer bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                        >
                          <img
                            className="mt-0.5"
                            src="images/icons/furniture/arr_left.svg"
                            alt="arr_left"
                          />
                          <h1 className="text-sm font-medium">Back</h1>
                          <h1 className="ml-auto text-start font-medium text-sm text-[#69E785] first-letter:uppercase">
                            {selectedCategory}
                          </h1>
                        </button>
                        {furnitureItems[selectedCategory].items
                          .filter((value) =>
                            value.label
                              .toLowerCase()
                              .includes(searchAny?.toLowerCase() ?? "")
                          )
                          .map((item, i) => (
                            <div
                              key={i}
                              className="bg-[#282828]/90 border border-white/[0.07] px-2 py-3 flex items-center rounded gap-1"
                            >
                              <HiTemplate />
                              <h1 className="text-sm font-medium">
                                {item.label}
                              </h1>
                              <div className="ml-auto flex gap-2 items-center">
                                <div className="flex gap-0.5 items-center">
                                  <h1 className="text-sm font-medium text-white/60">
                                    {item.price}
                                  </h1>
                                  <svg
                                    width="9"
                                    height="14"
                                    viewBox="0 0 9 14"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                  >
                                    <path
                                      id="$"
                                      d="M6.71636 6.6074C8.06862 7.20517 8.75202 8.08883 8.75202 9.2194C8.75202 10.8568 7.15257 12.1043 5.00059 12.1823L4.84064 13.2479H2.74682L2.95039 11.9094C1.88894 11.5455 1.00197 10.8568 0.478516 9.97311L2.5578 8.73858C2.73228 9.05046 2.95039 9.36234 3.3139 9.62224L3.61925 7.68598C3.35752 7.56903 3.12487 7.46507 3.02309 7.42608C1.97618 6.94527 0.885648 6.25653 0.885648 4.73611C0.871107 3.9694 1.191 3.28067 1.78715 2.74787C2.47055 2.1501 3.47384 1.78624 4.56438 1.74725L4.69524 0.837601H6.8036L6.60004 2.08512C7.487 2.42299 8.21402 3.03376 8.67932 3.80047L6.61458 4.91804C6.51279 4.73611 6.38193 4.54118 6.23653 4.41123L5.94572 6.26952C6.25107 6.39948 6.54187 6.52943 6.71636 6.6074ZM3.98276 5.41185L4.22995 3.82646C3.75011 3.94341 3.43022 4.19032 3.37206 4.52819C3.32844 4.7621 3.35752 5.09997 3.98276 5.41185ZM6.10566 9.4793C6.25107 9.10244 6.0475 8.75158 5.58221 8.51767L5.33502 10.0641C5.72761 9.9861 5.98934 9.79118 6.10566 9.4793Z"
                                      fill="rgba(255,255,255,0.6)"
                                    />
                                  </svg>
                                </div>
                                <button
                                  onClick={(e) =>
                                    handlePreviewFurniture(e, item)
                                  }
                                  className="p-0.5 bg-[#69E785]/90"
                                >
                                  <FaPlus className="text-white" />
                                </button>
                              </div>
                            </div>
                          ))}
                      </>
                    )}
                  </>
                )}
                {o_page == "purchase-detail" && (
                  <>
                    <button
                      onClick={handleGoBackPurchase}
                      className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                    >
                      <img
                        className="mt-0.5"
                        src="images/icons/furniture/arr_left.svg"
                        alt="arr_left"
                      />
                      <h1 className="text-sm font-medium">
                        {t("lFurniture.back")}
                      </h1>
                    </button>
                    <div className="bg-[#282828]/90 border border-white/[0.07] px-2 py-3 flex items-center rounded gap-1 text-white/75">
                      <PiSelectionForeground className="min-w-4 min-h-4 max-w-4 max-h-4" />
                      <h1 className="text-sm font-medium whitespace-nowrap overflow-hidden text-ellipsis">
                        {purchaseDetail?.label} ({purchaseDetail?.model})
                      </h1>
                    </div>
                  </>
                )}
              </>
              <>
                {o_page == "owned" &&
                  ownedFurnitures
                    .sort((a, b) =>
                      a.isPlaced === b.isPlaced ? 0 : a.isPlaced ? -1 : 1
                    )
                    .map((furniture, i) => (
                      <button
                        key={i}
                        onClick={(e) => handleClickOwnedFurniture(e, furniture)}
                        className="cursor-pointer bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1"
                      >
                        <HiTemplate />
                        <h1 className="text-sm font-medium">
                          {furniture.label}
                        </h1>
                        {furniture.isPlaced && (
                          <h1 className="text-xs text-white/75 font-medium">
                            [{t("lFurniture.placed")}]
                          </h1>
                        )}
                        <div className="ml-auto flex gap-3 items-center">
                          <img
                            className="rotate-180"
                            src="images/icons/furniture/arr_left.svg"
                            alt="arr_left"
                          />
                        </div>
                      </button>
                    ))}
              </>
              <>
                {o_page == "owned-detail" && (
                  <>
                    <button
                      onClick={handleGoBackOwned}
                      className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                    >
                      <img
                        className="mt-0.5"
                        src="images/icons/furniture/arr_left.svg"
                        alt="arr_left"
                      />
                      <h1 className="text-sm font-medium">
                        {t("lFurniture.back_to_owned")}
                      </h1>
                      <h1 className="ml-auto text-start font-medium text-sm text-[#69E785] first-letter:uppercase">
                        {ownedDetail?.label}
                      </h1>
                    </button>
                    {ownedDetail?.isPlaced ? (
                      <>
                        <button
                          onClick={handleOwnedFurnitureEdit}
                          className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                        >
                          <FaLocationCrosshairs />
                          <h1 className="text-sm font-medium">
                            {t("lFurniture.edit_furniture")}
                          </h1>
                          <div className="ml-auto flex gap-3 items-center">
                            <img
                              className="rotate-180"
                              src="images/icons/furniture/arr_left.svg"
                              alt="arr_left"
                            />
                          </div>
                        </button>
                        <button
                          onClick={handleOwnedFurniturePutInStorage}
                          className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                        >
                          <LuWarehouse />
                          <h1 className="text-sm font-medium">
                            {t("lFurniture.put_in_storage")}
                          </h1>
                          <div className="ml-auto flex gap-3 items-center">
                            <img
                              className="rotate-180"
                              src="images/icons/furniture/arr_left.svg"
                              alt="arr_left"
                            />
                          </div>
                        </button>
                      </>
                    ) : (
                      <>
                        <button
                          onClick={handleOwnedFurnitureReSell}
                          className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                        >
                          <FaCircleDollarToSlot />
                          <h1 className="text-sm font-medium">
                            {t("lFurniture.resell")}
                          </h1>
                          <div className="ml-auto flex gap-3 items-center">
                            <h1 className="text-sm font-medium">
                              {ownedDetail?.price} {t("money_type")}
                            </h1>
                            <img
                              className="rotate-180"
                              src="images/icons/furniture/arr_left.svg"
                              alt="arr_left"
                            />
                          </div>
                        </button>
                        <button
                          onClick={handleOwnedFurniturePlaceGround}
                          className="bg-[#282828]/90 border border-white/[0.07] hover:border-white/50 px-2 py-3 flex items-center rounded gap-1 hover:text-white text-white/60"
                        >
                          <PiSelectionForeground />
                          <h1 className="text-sm font-medium">
                            {t("lFurniture.place_on_ground")}
                          </h1>
                          <div className="ml-auto flex gap-3 items-center">
                            <img
                              className="rotate-180"
                              src="images/icons/furniture/arr_left.svg"
                              alt="arr_left"
                            />
                          </div>
                        </button>
                      </>
                    )}
                  </>
                )}
              </>
            </div>
          </div>
          <div className="w-[260px] -mr-3.5 flex flex-col pb-32 gap-3">
            <div className="flex gap-2 w-full justify-end">
              <div>
                <h1 className="text-13 font-bold text-right">
                  {t("lFurniture.object_settings")}
                </h1>
                <h1 className="text-11 font-medium text-white/50">
                  {t("lFurniture.desc_object_settings")}
                </h1>
              </div>
              <div className="relative flex items-center justify-center">
                <img
                  src="images/icons/furniture/ellipse_3.svg"
                  alt="ellipse_3"
                />
                <div className="absolute flex items-center justify-center">
                  <img
                    src="images/icons/furniture/polygon_4.svg"
                    alt="polgon_4"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="absolute bottom-0 right-0 select-none">
          <div className="flex items-center justify-end gap-2 mb-2">
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[Caps]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.switch_mode", { mode: "Game/UI" })}
              </h1>
            </div>
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[W]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.switch_mode", { mode: "Translate" })}
              </h1>
            </div>
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[R]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.switch_mode", { mode: "Rotate" })}
              </h1>
            </div>
          </div>
          <div className="flex items-center justify-end gap-2 mb-2">
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[Delete]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.delete_object")}
              </h1>
            </div>
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[LAlt]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.snap_ground")}
              </h1>
            </div>
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[Enter]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.finish_editing")}
              </h1>
            </div>
          </div>
          <div className="flex items-center justify-end gap-2 mb-2">
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[W/S/A/D]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.camera_move")}
              </h1>
            </div>
            <div className="flex items-center justify-center text-white/40 font-medium text-13">
              <h1 className="bg-white/[0.07] p-2 rounded-l">[Arrow Keys]</h1>
              <h1 className="bg-white/[0.09] p-2 rounded-r">
                {t("lFurniture.camera_rotation")}
              </h1>
            </div>
          </div>
          <div className="flex items-center justify-end text-white/40 font-medium text-13">
            <h1 className="bg-white/10 p-2">
              {t("lFurniture.desc_enter_del")}
            </h1>
          </div>
        </div>
      </div>
    </div>
  );
};
