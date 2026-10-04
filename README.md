# device/appthere

Device trees for **AppThere OS** (AOSP 17 fork, 64-bit only, arm64 + x86_64).

## Targets

| Product | Arch | Status | Purpose |
| --- | --- | --- | --- |
| `appthere_cf_x86_64` | x86_64 | bring-up | **Primary dev target.** Cuttlefish virtual device; minutes-long iteration loop. All desktop/Terminal work lands here first. |
| `appthere_arm64` | arm64 | bring-up | Treble GSI. Staging for Pixel 6a and tablets. |
| `appthere_x86_64` | x86_64 | bring-up | Staging for the laptop target. Does **not** boot bare metal yet — see Phase 5. |
| `appthere_bluejay` | arm64 | planned | Pixel 6a. Needs LineageOS 24 device trees + Google driver binaries. |
| `appthere_chromebook` | x86_64 | planned | HP Chromebook x360 (i3-8130U). Needs MrChromebox UEFI + distro-class kernel + Mesa. |

## Layout

```
common/            shared across all targets
  appthere_base.mk   64-bit-only base, inherited by every product
  desktop.mk         desktop window management
  terminal.mk        Linux dev environment (AVF)
  overlay/           frameworks/base resource overlays
<target>/          per-target AndroidProducts.mk + product mk + BoardConfig.mk
```

## 64-bit only

Enforced in two places, both required:

1. `common/appthere_base.mk` inherits `core_64_bit_only.mk`.
2. Each `BoardConfig.mk` **omits** `TARGET_2ND_ARCH`.

Defining any `TARGET_2ND_*` variable silently reintroduces the 32-bit build
and defeats (1). There is no error — you just get a bigger image with a
32-bit zygote.

## Unverified knobs

Files carrying `!! VERIFY AFTER FIRST SYNC` reference `config_*` resources,
aconfig flags or inherit paths whose names move between AOSP releases. A
`config_*` name that does not exist upstream is **silently ignored**, so a
stale name fails open and presents as "the feature just won't turn on".

Run `scripts/verify-feature-knobs.sh` against the synced tree before trusting
them.
