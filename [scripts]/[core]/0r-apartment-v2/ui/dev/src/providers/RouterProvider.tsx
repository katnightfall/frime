import React, { createContext, useEffect, useMemo, useState } from "react";
import { useNuiEvent } from "@/hooks/useNuiEvent";
import { PageTypes, RouterProviderProps } from "@/types/RouterProviderTypes";
import { Catalog } from "@/pages/Catalog";
import { debugData } from "@/utils/debugData";
import { InRoom } from "@/pages/InRoom";
import { Furniture } from "@/pages/Furniture";
import { Elevator } from "@/pages/Elevator";

debugData([{ action: "ui:setRouter", data: "catalog" as PageTypes }]);

export const RouterCtx = createContext<RouterProviderProps>(
  {} as RouterProviderProps
);

export const RouterProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [router, setRouter] = useState<PageTypes>("catalog");
  const [page, setPage] = useState<React.ReactNode | null>(null);

  useNuiEvent("ui:setRouter", setRouter);

  useEffect(() => {
    if (router == "catalog") setPage(<Catalog />);
    else if (router == "in-room") setPage(<InRoom />);
    else if (router == "furniture") setPage(<Furniture />);
    else if (router == "elevator") setPage(<Elevator />);
    else setPage(<Catalog />);
  }, [router]);

  const value = useMemo(() => {
    return {
      router,
      setRouter,
      page,
    };
  }, [router, page]);

  return <RouterCtx.Provider value={value}>{children}</RouterCtx.Provider>;
};

export default RouterProvider;
