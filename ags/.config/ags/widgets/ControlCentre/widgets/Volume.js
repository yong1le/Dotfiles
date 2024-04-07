import { getMicIcon, getVolumeIcon } from "../../../utils/utils.js";

const audio = await Service.import("audio");

const getIcon = (/** @type {"speaker" | "microphone"} */ type) => {
  if (type === "speaker") {
    return getVolumeIcon(
      audio.speaker.stream?.is_muted,
      audio.speaker.volume,
    );
  } else {
    return getMicIcon(audio.microphone.stream?.is_muted);
  }
};

const VolumeLabel = () =>
  Widget.EventBox({
    vpack: "center",
    child: Widget.Label({
      label: audio.speaker
        .bind("volume")
        .as((vol) => `${Math.floor(vol * 100)}%`),
    }),
  });

const VolumeIcon = () =>
  Widget.EventBox({
    vpack: "center",
    on_primary_click: () => Utils.subprocess(["pamixer", "-t"], () => {}),
    on_scroll_up: () => (audio.speaker.volume += 0.05),
    on_scroll_down: () => (audio.speaker.volume -= 0.05),
    child: Widget.Icon({
      icon: Utils.watch(getIcon("speaker"), audio.speaker, () =>
        getIcon("speaker"),
      ),
    }),
  });

const VolumeSlider = () =>
  Widget.Slider({
    hexpand: true,
    draw_value: false,
    on_change: ({ value, dragging }) => {
      if (dragging) {
        audio.speaker.volume = value;
      }
    },
    value: audio.speaker.bind("volume"),
  });

export const Volume = () =>
  Widget.Box({
    class_name: "slider-controls",
    spacing: 16,
    children: [VolumeIcon(), VolumeSlider(), VolumeLabel()],
  });

export const Mic = () =>
  Widget.Button({
    on_primary_click: () =>
      Utils.subprocess(["pamixer", "--default-source", "-t"], () => {}),
    hexpand: true,
    class_names: ["control-button"],
    setup: (self) =>
      self.hook(audio.microphone, () => {
        self.toggleClassName("active", !audio.microphone.stream?.is_muted);
      }),
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({
          icon: Utils.watch(getIcon("microphone"), audio.microphone, () =>
            getIcon("microphone"),
          ),
        }),
        Widget.Label({
          label: Utils.watch(getIcon("microphone"), audio.microphone, () =>
            getIcon("microphone"),
          ).as((s) => (s.includes("mute") ? "Muted" : "Active")),
        }),
      ],
    }),
  });
