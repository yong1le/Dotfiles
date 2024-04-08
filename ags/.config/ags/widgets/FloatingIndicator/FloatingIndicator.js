import { getVolumeIcon } from "../../utils/utils.js";
import brightness from "../../services/brightness.js";

const audio = await Service.import("audio");

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
        class_name: "f-i-slider",
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
        class_name: "f-i-slider",
        hexpand: true,
        sensitive: false,
        draw_value: false,
        value: brightness.bind("screen_value"),
      }),
    ],
  });
}

export function VolumeFloatingIndicator() {
  return Widget.Window({
    name: "volumefloatingindicator",
    class_name: "volume-floating-indicator",
    anchor: ["bottom"],
    setup: (self) => {
      App.applyCss(
        `${App.configDir}/widgets/FloatingIndicator/FloatingIndicator.css`,
      );
      self.hook(
        audio,
        (self) => {
          if (self.is_visible()) return;
          App.openWindow("volumefloatingindicator");

          setTimeout(() => {
            App.closeWindow("volumefloatingindicator");
          }, 3000);
        },
        "speaker-changed",
      );
    },
    visible: false,
    child: Widget.Box({
      class_name: "volume-indicator-inner",
      child: Volume(),
    }),
  });
}

export function BrightnessFloatingIndicator() {
  return Widget.Window({
    name: "brightnessfloatingindicator",
    class_name: "brightness-floating-indicator",
    anchor: ["bottom"],
    setup: (self) => {
      self.hook(
        brightness,
        (self) => {
          if (self.is_visible()) return;
          App.openWindow("brightnessfloatingindicator");

          setTimeout(() => {
            App.closeWindow("brightnessfloatingindicator");
          }, 3000);
        },
        "screen-changed",
      );
    },
    visible: false,
    child: Widget.Box({
      class_name: "brightness-indicator-inner",
      child: Brightness(),
    }),
  });
}
