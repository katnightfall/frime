// Will return whether the current environment is in a regular browser
// and not CEF
export const isEnvBrowser = (): boolean => !window.invokeNative;

// Basic no operation function
export const noop = (): void => {};

export function formatNumber(number: string): string {
  if (!number) return "";
  const reversed = number.split("").reverse().join("");
  const formatted = reversed.match(/.{1,3}/g)?.join(" ");
  return formatted?.split("").reverse().join("") || "";
}

export const getDateTimeDifference = (
  timestamp: number
): { days: number; hours: number } => {
  const currentDate = new Date();
  const sentDate = new Date(timestamp);

  const differenceInMilliseconds = Math.abs(
    currentDate.getTime() - sentDate.getTime()
  );
  const daysDifference = Math.floor(
    differenceInMilliseconds / (1000 * 60 * 60 * 24)
  );
  const hoursDifference = Math.floor(
    (differenceInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
  );

  return { days: daysDifference, hours: hoursDifference };
};
