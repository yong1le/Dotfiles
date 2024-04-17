export function Clock() {
  const date = Variable("", {
    poll: [1000, 'date "+%A, %b.%e, %I:%M %p"'],
  });

  return Widget.Button({
    on_clicked: () => {
      App.ToggleWindow("popupcalendar");
    },
    class_name: "clock",
    child: Widget.Label({
      label: date.bind(),
    }),
  });
}
