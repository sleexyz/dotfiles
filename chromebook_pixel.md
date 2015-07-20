# Chromebook Pixel 2015
```
April 2015 - Present
```
- Best desktop linux experience so far... but unstable AF.
- Crashes and gets powerwashed once a month.
- First one died after three months: boot memory disconnected internally, or something. Got it RMA'd and replaced.



## crouton
`[crouton](https://github.com/dnschneid/crouton) = OOTB hardware support + desktop linux = bliss`

## ectool
Do fancy shit with lightbar and sensors.

*chromeos*: `/usr/sbin/ectool`.

*crouton*: get it at [ppa:longsleep/pixel-extras](https://launchpad.net/~longsleep/+archive/ubuntu/pixel-extras).

Tested on ubuntu chroot; works with the following flags:

```
ectool --interface=lpc --name=cros_ec
```

## Audio
[How to set up ALSA and JACK to talk directly to hardware](https://github.com/dnschneid/crouton/wiki/Access-audio-hardware-directly-(ALSA,-JACK))

## Touchpad
Chrome Multi Touch (CMT)
...tbc


## Touchscreen
...tbc
