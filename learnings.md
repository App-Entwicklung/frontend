# Learnings & Findings

## Learnings

### [Vercel](https://vercel.com) Deployment
 
In order to deploy a Flutter web app to Vercel, you need to have a Flutter Web App on GitHub/GitLab and a Vercel account or Login via GitHub.

1. Start by creating a new project on Vercel by clicking the "New Project" button on the top right of the dashboard.
2. Select a Git repository and then click "Import".
3. Under the "Build & Development Settings" section, select Other as the Framework Preset.
4. Override the Build command, Output directory and Install command with the following settings:
   - Build command: ``flutter/bin/flutter build web --release``
   - Output directory: ``build/web``
   - Install command: ``if cd flutter; then git pull && cd .. ; else git clone https://github.com/flutter/flutter.git; fi && ls && flutter/bin/flutter doctor && flutter/bin/flutter pub get && flutter/bin/flutter clean && flutter/bin/flutter config --enable-web``
5. Click the "Deploy" button.

## Findings

- [Flutter-Templates etc.](https://github.com/Solido/awesome-flutter)
- [Flutter + Metamask](https://dev.to/bhaskardutta/building-with-flutter-and-metamask-8h5)
- [DApp w/ Flutter & sol](https://blog.logrocket.com/building-dapp-flutter-solidity/)

## Open to discuss

Upgrading new Contracts -> let User select if new Contract is deployed which to use
