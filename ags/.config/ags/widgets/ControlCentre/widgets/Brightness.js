import brightness from "../../../services/brightness.js";

const BrightnessSlider = () => {
  return Widget.Slider({
    hexpand: true,
    draw_value: false,
    on_change: (self) => (brightness.screen_value = self.value),
    value: brightness.bind("screen_value"),
  });
};

const BrightnessLabel = () => {
  return Widget.Label({
    label: brightness
      .bind("screen_value")
      .as((v) => `${Math.round(v * 100)}%`),
  });
};

const BrightnessIcon = () => {
  return Widget.EventBox({
    on_scroll_up: () => (brightness.screen_value += 0.05),
    on_scroll_down: () => (brightness.screen_value -= 0.05),
    child: Widget.Icon({
      icon: "display-brightness-symbolic",
    }),
  });
};

export const Brightness = () => {
  return Widget.Box({
    class_name: "slider-controls",
    spacing: 16,
    children: [BrightnessIcon(), BrightnessSlider(), BrightnessLabel()],
  });
};
