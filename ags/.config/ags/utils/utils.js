/**
 * @param {number} seconds
 */
export function secondsToTime(seconds) {
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);

  // Formatting: add leading zero if single digit
  const hoursStr = hours < 10 ? "0" + hours : hours;
  const minutesStr = minutes < 10 ? "0" + minutes : minutes;

  return `${hoursStr} : ${minutesStr}`;
}

export const getVolumeIcon = (
  /** @type {any} */ muted,
  /** @type {any} */ volume,
) => {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  const icon = muted
    ? 0
    : [101, 67, 34, 1, 0].find((threshold) => threshold <= volume * 100);

  return `audio-volume-${icons[icon]}-symbolic`;
};

export const getMicIcon = (/** @type {any} */ muted) => {
  return muted ? "microphone-sensitivity-muted" : "microphone-sensitivity-high";
};
