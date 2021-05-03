const fs = require('fs');


const solve = async() => {
    const { Octokit } = require("@octokit/rest");
const { createAppAuth } = require("@octokit/auth-app");

const appOctokit = new Octokit({
  authStrategy: createAppAuth,
  auth: {
    appId: 105926,
    privateKey: fs.readFileSync('cv-pr-testing.2021-03-19.private-key.pem', 'utf8'),
    // optional: this will make appOctokit authenticate as app (JWT)
    //           or installation (access token), depending on the request URL
    installationId: 15503724
  },
});

const { token } = await appOctokit.auth({
    type: "installation",
    // defaults to `options.auth.installationId` set in the constructor
    installationId: 15503724,
  });
  console.log(token);
appOctokit.pulls.create({
  owner: 'cvlehe',
  repo: 'fem-fox-game',
  head: 'test/automated-pr',
  base: 'test/automated-pr-master',
  title: 'Hello PR'
});

// const branches = await appOctokit.repos.listBranches({
//   owner: 'cvlehe',
//   repo: 'fem-fox-game',
// });
// console.log("branches:", branches);
}

solve();
