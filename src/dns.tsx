import { Action, ActionPanel, Detail, Icon, List } from "@raycast/api";

export default function Command() {
  return (
    <List>
      <List.Item
        icon={Icon.Bird}
        title="DNS"
        actions={
          <ActionPanel>
            <Action.Push title="Select DNS from list" target={<Detail markdown="# Hey! dns 👋" />} />
          </ActionPanel>
        }
      />
    </List>
  );
}
