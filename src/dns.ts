#!/usr/bin/env node
import { Clipboard, showHUD } from "@raycast/api";
import { exec } from 'child_process';
import { serversConstant } from './servers';


export default async function main() {
  const now = new Date();
  const dns: string | undefined = 'Shecan'; // todo: get from user argsv

  const server = serversConstant.find(server => server.name.toLowerCase() === dns?.toLowerCase())
  const NETWORK = '/usr/sbin/networksetup'
  const FLAGS = [
    "-setdnsservers",
    "Wi-Fi\\",
    server?.servers.join(' ') || JSON.stringify('empty')
  ]


  await Clipboard.copy(now.toLocaleDateString());
  exec(`${NETWORK} ${FLAGS.join(' ')}`, (err, stdout, stderr) => {
    console.log(err, stderr, stdout)
  });
  await showHUD("Secan has been set");
}
