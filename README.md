## Applying a GIT Patchfile

  - cd $GOPATH/src/github.com/packer
  - git apply --stat ${clone_dir}/post-processor.go.patch   ## take a look
  - git apply --check ${clone_dir}/post-processor.go.patch  ## triage patch
  - git apply ${clone_dir}/post-processor.go.patch          ## apply patch

## What this patchfile does

This patchfile fixes a inherent flaw in the vSphere Post Processor that automatically
appends an uneeded / when a resource pool is missing. Using this, the flag for resource
pool is now an optional field. In addition to this fix, several new flags have been
added for better usage with the vSphere's OVFTool.

 - --ipAllocationPolicy ## IP allocation policy for a deployed OVF, values are DHCP, Transient, Fixed and FixedAllocated
 - --compression        ## Will compress the disks of the OVF, 1=Fastest 9=Highest Compression
 - --overwrite          ## Flag will clobber an existing OVF Template
 - --powerOn            ## Will turn OVF Template on after placement (currently not compatible with overwrite)
