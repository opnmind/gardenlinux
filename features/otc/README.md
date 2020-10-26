# Uploading Image to OpenTelekomCloud

- create compressed qcow2 image (disk must be called rootfs.raw)

```shell
$ qemu-image convert -f raw -O qcow2 -c rootfs.raw gardenlinux-otc-<VERSION>.qcow2
```

- upload qcow2:

```shell
$ s3 put <bucket-name>/gardenlinux-otc-<VERSION>.qcow2 filename=gardenlinux-otc-<VERSION>.qcow2
```


- create image from disk:

```shell
$ openstack image create \
    --container-format bare \
    --disk-format qcow2 \
    --min-disk 16 \
    --min-ram 1024 \
    --file gardenlinux-otc-<VERSION>.qcow2 \
    gardenlinux-otc-<VERSION> \
    -f json
```

- create image from bucket:

```shell
$ glance image create gardenlinux-otc-<VERSION> s3://<bucket-name>/gardenlinux-otc-<VERSION>.qcow2
```

# TODO

- Kernel Parameter ?