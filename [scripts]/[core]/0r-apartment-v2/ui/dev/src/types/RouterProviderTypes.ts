export type PageTypes =
  | "catalog"
  | "in-room"
  | "furniture"
  | "elevator";

export type RouterProviderProps = {
  router: PageTypes;
  setRouter: (router: PageTypes) => void;
  page: React.ReactNode;
};
