import { getMicIcon, getVolumeIcon } from "../../utils/utils.js";

import brightness from "../../services/brightness.js";
const audio = await Service.import("audio");
const powerprofiles = await Service.import("powerprofiles");

function Volume() {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: Utils.watch(
          getVolumeIcon(audio.speaker.stream?.is_muted, audio.speaker.volume),
          audio.speaker,
          () =>
            getVolumeIcon(audio.speaker.stream?.is_muted, audio.speaker.volume),
        ),
      }),
      Widget.Label({
        label: audio.speaker
          .bind("volume")
          .as((vol) => `${Math.floor(vol * 100)}%`),
      }),
      Widget.Slider({
        class_name: "osd-slider",
        hexpand: true,
        sensitive: false,
        draw_value: false,
        value: audio.speaker.bind("volume"),
      }),
    ],
  });
}

function Brightness() {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: "display-brightness-symbolic",
      }),
      Widget.Label({
        label: brightness
          .bind("screen_value")
          .as((v) => `${Math.round(v * 100)} %`),
      }),
      Widget.Slider({
        class_name: "osd-slider",
        hexpand: true,
        sensitive: false,
        draw_value: false,
        value: brightness.bind("screen_value"),
      }),
    ],
  });
}

function Mic() {
  const getMicLabel = () => {
    if (audio.microphone.stream?.is_muted) return "Microphone is Muted";
    return "Microphone is Active";
  };

  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: Utils.watch(
          getMicIcon(audio.microphone.stream?.is_muted),
          audio.microphone,
          () => getMicIcon(audio.microphone.stream?.is_muted),
        ),
      }),
      Widget.Label({
        label: Utils.watch(getMicLabel(), audio.microphone, getMicLabel),
      }),
    ],
  });
}

function PPD() {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: powerprofiles.bind("icon_name").as((p) => `${p}`),
      }),
      Widget.Label({
        label: powerprofiles.bind("active_profile").as((p) => `${p}`),
      }),
    ],
  });
}

/** @param {"volume" | "brightness" | "mic" | "ppd"} type */
function getOSD(type) {
  switch (type) {
    case "brightness":
      return Brightness;
    case "volume":
      return Volume;
    case "mic":
      return Mic;
    case "ppd":
      return PPD;
  }
}

/** @param {"volume" | "brightness" | "mic" | "ppd"} type */
export default function OSD(type) {
  return Widget.Window({
    name: `osd-${type}`,
    class_name: "osd",
    anchor: ["bottom"],
    layer: "overlay",
    visible: false,
    setup: () => {
      App.applyCss(`${App.configDir}/widgets/OSD/OSD.css`);
    },
    child: Widget.Box({
      name: `osd-${type}-inner`,
      class_name: "osd-inner",
      child: getOSD(type)(),
    }),
  });
}
