# nix-insync-headless

This will be a nix-derivation that packages insync-headless.

## installation

1. install nix
1. clone this repository
1. open a terminal in this folder
1. run `nix-shell`
1. run `insync-headless start --no-daemon --debug 10`

## problems

Insync starts with the following output:

```
INFO     2020-11-21 19:04:53,386 [mainlogs:_log_run:122] Core(app_version=3.0.4.10602, platform=Linux-x86_64-nixos/20.09.1698.96052f35023) initialized
DEBUG    2020-11-21 19:04:53,441 [workbase:__init__:207] INIT App()
DEBUG    2020-11-21 19:04:53,441 [workbase:__init__:207] INIT Shell()
DEBUG    2020-11-21 19:04:53,442 [workbase:__init__:207] INIT NoticeFeed()
DEBUG    2020-11-21 19:04:53,442 [workbase:__init__:207] INIT ProgressFeed()
DEBUG    2020-11-21 19:04:53,442 [workbase:__init__:207] INIT Telemetry()
DEBUG    2020-11-21 19:04:53,443 [workbase:__init__:207] INIT ActivityNotification()
DEBUG    2020-11-21 19:04:53,444 [workbase:__init__:207] INIT HeadlessLicenseService()
DEBUG    2020-11-21 19:04:53,444 [licensing:_verify_signature:204] While verifying signature: ModuleNotFoundError("No module named 'idesksync.testing'")
DEBUG    2020-11-21 19:04:53,449 [workbase:__run:245] RUN App()
DEBUG    2020-11-21 19:04:53,450 [workbase:__run:245] RUN Shell()
DEBUG    2020-11-21 19:04:53,450 [workbase:__run:245] RUN NoticeFeed()
DEBUG    2020-11-21 19:04:53,451 [workbase:__run:245] RUN ProgressFeed()
DEBUG    2020-11-21 19:04:53,451 [workbase:__run:245] RUN Telemetry()
DEBUG    2020-11-21 19:04:53,452 [workbase:__run:245] RUN ActivityNotification()
DEBUG    2020-11-21 19:04:53,452 [workbase:__run:245] RUN HeadlessLicenseService()
INFO     2020-11-21 19:04:53,454 [main:start_core:48] core started
INFO     2020-11-21 19:04:53,454 [unix_socket_server:start:106] unix socket server thread start
DEBUG    2020-11-21 19:04:53,487 [base_events:_run_once:1733] poll 195.687 ms took 22.332 ms: 1 events
DEBUG    2020-11-21 19:04:53,528 [base_events:_run_once:1733] poll 167.798 ms took 35.984 ms: 1 events
DEBUG    2020-11-21 19:04:53,563 [base_events:_run_once:1733] poll 129.818 ms took 32.963 ms: 1 events
DEBUG    2020-11-21 19:04:53,673 [base_events:_run_once:1733] poll 772.521 ms took 6.173 ms: 1 events
DEBUG    2020-11-21 19:04:53,780 [base_events:_run_once:1733] poll 759.536 ms took 99.850 ms: 1 events
DEBUG    2020-11-21 19:04:53,885 [base_events:_run_once:1733] poll 654.677 ms took 99.999 ms: 1 events
DEBUG    2020-11-21 19:04:54,190 [base_events:_run_once:1733] poll 548.968 ms took 298.913 ms: 1 events
DEBUG    2020-11-21 19:04:54,572 [base_events:_run_once:1733] poll 907.717 ms took 35.409 ms: 1 events
```

But getting its status from another terminal with `insync-headless status` tells the following:

```
Insync doesn't seem to be running. Start it first.
```

Other commands, like adding an account tell the same.
