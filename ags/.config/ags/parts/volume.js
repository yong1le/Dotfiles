const audio = await Service.import("audio");

const icons = {
  101: "overamplified",
  67: "high",
  34: "medium",
  1: "low",
  0: "muted",
};

function getVolumeIcon() {
  const icon = audio.speaker.stream?.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find(
        (threshold) => threshold <= audio.speaker.volume * 100,
      );

  return `audio-volume-${icons[icon]}-symbolic`;
}

function getVolume() {
  if (audio.speaker.stream?.is_muted) return "";
  return `${Math.round(audio.speaker.volume * 100)} %`;
}

export const VolumeLabel = () => {
  const volumeIcon = Utils.watch(getVolumeIcon(), audio.speaker, getVolumeIcon);
  const volume = Utils.watch(getVolume(), audio.speaker, getVolume);

  return Widget.Box({
    class_name: "volume-label",
    spacing: 8,
    children: [
      Widget.Icon({
        icon: volumeIcon,
      }),
      Widget.Label({
        label: volume,
      }),
    ],
  });
};

export const VolumeSlider = () => {
  return Widget.Slider({
    class_name: "volume-slider",
    hexpand: true,
    draw_value: false,
    on_change: ({ value }) => (audio.speaker.volume = value),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        self.value = audio.speaker.volume || 0;
      }),
  });
};