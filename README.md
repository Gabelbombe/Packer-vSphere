## Applying a GIT Patchfile

```shell
  $ cd $GOPATH/src/github.com/packer
  $ git apply --stat ${clone_dir}/post-processor.go.patch   ## take a look
  $ git apply --check ${clone_dir}/post-processor.go.patch  ## triage patch
  $ git apply ${clone_dir}/post-processor.go.patch          ## apply patch
```


## What this patchfile does

This patchfile fixes a inherent flaw in the vSphere Post Processor that automatically
appends an uneeded / when a resource pool is missing. Using this, the flag for resource
pool is now an optional field. In addition to this fix, several new flags have been
added for better usage with the vSphere's OVFTool.

```shell
  --ipAllocationPolicy ## IP polices the OVF, values are DHCP, Transient, Fixed and FixedAllocated
  --compression        ## Will compress the disks of the OVF, 1=Fastest 9=Highest Compression
  --overwrite          ## Flag will clobber an existing OVF Template
  --powerOn            ## Will turn OVF Template on after placement (currently incompatible with overwrite)
```


## Requirements

 - [Building Packer](https://github.com/mitchellh/packer) from scratch and applying [patchfile](https://git.internal.t-mobile.com/jdaniel56/Packer-vSphere/blob/master/post-processor.go.patch)
 - Clone of my [Packer repository](https://git.internal.t-mobile.com/jdaniel56/Packer)
 - Internet connection for ISO download


## Configurations
 - Configuring and adding .bashrc contents to you rc local file, followed by `exec bash`


## Running
 - `$ ./testrun.sh`
