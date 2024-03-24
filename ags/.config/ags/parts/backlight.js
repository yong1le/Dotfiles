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
    spacing: 16,
    children: [
      Widget.Label({
        class_name: "backlight-label-icon",
        label: "󰹑",
      }),
      Widget.Label({
        label: brightness
          .bind("screen_value")
          .as((v) => `${Math.round(v * 100)} %`),
      }),
    ],
  });
};
