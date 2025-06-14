# OnyxOS Server Edition
This is a customized atomic image based off of uCore from the Universal Blue project. It includes the CachyOS Server Kernel along with some additional packages and tweaks.

## Important Notices
- This image does not currently support Secure Boot, as the CachyOS Server Kernel is unsigned
- There may be frequent changes to the composition of this image as new requirements are discovered

## Usage
1. Download and install the latest [uCore](https://fedoraproject.org/coreos/download?stream=stable) image
2. Rebase to the unsigned image using the following command:
```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/onyxazryn/onyxos-server-edition:latest
```
3. Rebase to the signed version of the image using the following command:
```
sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/onyxazryn/onyxos-server-edition:latest
```

## Resources
- [Universal Blue Images](https://github.com/ublue-os/main)
- [CachyOS Kernel Copr](https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos)
- [CachyOS Kernel Addons Copr](https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos-addons/)
