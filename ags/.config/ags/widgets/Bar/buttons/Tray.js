import { getMicIcon, getVolumeIcon } from "../../../utils/utils.js";

const audio = await Service.import("audio");
const systemtray = await Service.import("systemtray");
const battery = await Service.import("battery");

export function SysTray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({
          icon: item.bind("icon").as((i) => {
            return i
          }),
        }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
  });
}

export function Volume() {
  return Widget.Button({
    tooltip_text: audio.speaker.bind("volume").as((v) => `${Math.round(v * 100)} %`),
    on_primary_click: () => Utils.subprocess(["pamixer", "-t"], () => {}),
    on_secondary_click: () => Utils.subprocess(["pavucontrol"], () => {}),
    on_scroll_up: () => (audio.speaker.volume += 0.05),
    on_scroll_down: () => (audio.speaker.volume -= 0.05),
    child: Widget.Icon({
      icon: Utils.watch(
        getVolumeIcon(audio.speaker.stream?.is_muted, audio.speaker.volume),
        audio.speaker,
        () =>
          getVolumeIcon(audio.speaker.stream?.is_muted, audio.speaker.volume),
      ),
    }),
  });
}

export function Mic() {
  return Widget.Button({
    on_primary_click: () =>
      Utils.subprocess(["pamixer", "--default-source", "-t"], () => {}),
    on_secondary_click: () => App.ToggleWindow("controlcentre"),
    child: Widget.Icon({
      icon: Utils.watch(
        getMicIcon(audio.microphone.stream?.is_muted),
        audio.microphone,
        () => getMicIcon(audio.microphone.stream?.is_muted),
      ),
    }),
  });
}

export function Battery() {
  return Widget.Button({
    tooltip_text: battery.bind("percent").as(p => `${p} %`),
    on_primary_click: () => App.ToggleWindow("controlcentre"),
    child: Widget.Icon({
      icon: battery.bind("icon_name"),
    }),
  });
}
