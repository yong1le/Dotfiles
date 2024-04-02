const audio = await Service.import("audio");

function getVolumeIcon() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

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

function getMicIcon() {
  return audio.microphone.is_muted
    ? "microphone-sensitivity-muted-symbolic"
    : "audio-input-microphone-symbolic";
}

export const VolumeLabel = () => {
  const volumeIcon = Utils.watch(getVolumeIcon(), audio.speaker, getVolumeIcon);
  const volume = Utils.watch(getVolume(), audio.speaker, getVolume);
  const micIcon = Utils.watch(getMicIcon(), audio.microphone, getMicIcon);

  return Widget.EventBox({
    on_primary_click: () => Utils.subprocess(["pamixer", "-t"], () => {}),
    on_secondary_click: () => Utils.subprocess(["pamixer", "--default-source", "-t"], () => {}),
    on_scroll_up: () => (audio.speaker.volume += 0.05),
    on_scroll_down: () => (audio.speaker.volume -= 0.05),
    child: Widget.Box({
      class_name: "volume-label",
      spacing: 8,
      children: [
        Widget.Icon({
          icon: micIcon,
          class_name: "icon"
        }),
        Widget.Icon({
          class_name: "icon",
          icon: volumeIcon,
        }),
        Widget.Label({
          label: volume,
        }),
      ],
    }),
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
