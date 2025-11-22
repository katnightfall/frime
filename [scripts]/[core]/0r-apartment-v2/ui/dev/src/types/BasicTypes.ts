export type WallColorTypes = { id: number; color: string };

export type vec3 = { x: number; y: number; z: number };
export type vec4 = vec3 & { w: number };

export type indicatorsTypes = "electricity" | "power" | "gas" | "water";

export type iIndicators = {
  [key in indicatorsTypes]: number;
};

export type iIndicatorSettings = {
  [key in indicatorsTypes]: {
    unitPrice: number;
    maxValue: number;
  };
};

export interface iRoom {
  floor: number;
  room_id: number;
  label: string;
  price: number;
  daily_price: number;
  apartment_id: number;
  due_date: any;
  life_time: boolean;
}

export interface iInRoom extends iRoom {
  apartment_id: number;
  apartment_label: string;
  life_time: boolean;
  owner_name: string;
  options: {
    lights: boolean;
  };
  permissions: {
    user: string;
    playerName: string;
  }[];
  furnitures: OwnedFurnitureProps[];
  due_date: number;
  owner: boolean;
  guest: boolean;
  indicators: iIndicators;
}

export type FurnitureProps = {
  model: string;
  label: string;
  price: number;
};

export type FurnitureItemsProps = {
  [category: string]: {
    label: string;
    items: FurnitureProps[];
  };
};

export type OwnedFurnitureProps = FurnitureProps & {
  index: number;
  isPlaced: boolean;
  objectId: number;
  model: string;
};
