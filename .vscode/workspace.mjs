import fs from 'fs';
import {join, dirname} from 'path';
import { fileURLToPath } from 'url';
import { execSync } from 'child_process';
import { homedir } from 'os';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load settings.json and remove `files.exclude`
const workspacefile = join(__dirname, 'settings.json');
const workspace = JSON.parse(fs.readFileSync(workspacefile));
workspace["files.exclude"] = {};

// Find new value for `files.exclude`
const toBeExcluded = new Map();

execSync(
  "yadm ls-files -o -i --exclude-standard --directory",
  {
    cwd: homedir(),
    encoding: 'utf-8'
  }
).split('\n').forEach(i => {
  if (i !== '') toBeExcluded.set(i, true);
});

execSync(
  "yadm ls-files",
  {
    cwd: homedir(),
    encoding: 'utf-8'
  }
).split('\n').forEach(i => {
  if (i.includes('##')) {
    const alt = i.split('##');
    toBeExcluded.delete(alt[0]);
  }
});
workspace["files.exclude"] = Object.fromEntries(toBeExcluded);

fs.writeFileSync(
  workspacefile,
  JSON.stringify(workspace, null, '  ')
);