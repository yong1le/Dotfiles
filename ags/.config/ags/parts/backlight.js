import brightness from "../services/brightness.js";

export const BacklightSlider = () => {
  return Widget.Slider({
    class_name: "backlight-slider",
    hexpand: true,
    draw_value: false,
    on_change: (self) => (brightness.screen_value = self.value),
    value: brightness.bind("screen_value"),
  });
};


export const BacklightLabel = () => {
  return Widget.Box({
    class_name: "backlight-label",
    spacing: 8,
    children: [
      Widget.Icon({
        class_name: "icon",
        icon: "display-brightness-symbolic",
      }),
      Widget.Label({
        label: brightness
          .bind("screen_value")
          .as((v) => `${Math.round(v * 100)} %`),
      }),
    ],
  });
};
