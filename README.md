# ConvNeXtV2_cuda12.1.1
Refered to https://github.com/facebookresearch/ConvNeXt-V2
# Installation

We provide installation instructions for ImageNet classification experiments here.

## Dependency Setup
Create an new conda virtual environment
```
conda create -n convnextv2_cuda_12_1_1 python=3.8 -y
```
```
conda activate convnextv2_cuda_12_1_1
```
Install [Pytorch](https://pytorch.org/)>=1.8.0, [torchvision](https://pytorch.org/vision/stable/index.html)>=0.9.0 following official instructions. <br>
Refered to https://blog.csdn.net/qq_42537872/article/details/132322398
```
conda install -c nvidia cuda==12.1.1
```
```
pip install torch==2.3.0+cu121 torchvision==0.18.0+cu121 -f https://download.pytorch.org/whl/torch_stable.html
```
Check github permission: <br>

If meet Permission denied(publickey), according to the instructions on this webpage: <br> Refered to https://blog.csdn.net/qq_38825788/article/details/125859041, authorize the GitHub account.
```
ssh -T git@github.com
```
Clone this repo and install required packages:
```
git clone https://github.com/facebookresearch/ConvNeXt-V2.git
```
```
pip install timm==0.3.2 tensorboardX six
```
```
pip install submitit
```
```
conda install openblas-devel -c anaconda -y
```
Fix the Possible Error "Fatal: Needed a Single Revision"  by https://phoenixnap.com/kb/git-pull-submodule
```
cd ConvNeXt-V2
```
```
vim .gitmodules
```
Add a new line: <br>
(In vim mode, press i to enter insert mode, press esc to exit insert mode, and enter :wq to save and quit.)
```
branch = main
```
Install MinkowskiEngine:

*(Note: we have implemented a customized CUDA kernel for depth-wise convolutions, which the original MinkowskiEngine does not support.)*
```
git submodule update --init --recursive
```
```
git submodule update --recursive --remote
```
```
cd MinkowskiEngine
```
To address crypt.h: No such file or directory
```
cp /usr/include/crypt.h /home1/science103555/.conda/envs/convnextv2/include/python3.8/
```
To address nvtx3/nvToolsExt.h: No such file or directory, <br>
see: https://discuss.pytorch.org/t/failed-to-find-nvtoolsext/179635/3
```
python setup.py install --blas_include_dirs=${CONDA_PREFIX}/include --blas=openblas
```
Install apex
```
cd ..
```
```
git clone https://github.com/NVIDIA/apex
```
```
cd apex
```
```
pip install -v --no-build-isolation --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
```
Install Makefile. <br>
```
make pretrain
```
To address ModuleNotFoundError: No module named 'torch._six', change <br>
from torch._six import container_abcs to <br>
from torch import container_abcs
```
vim /home1/science103555/.conda/envs/convnextv2/lib/python3.8/site-packages/timm/models/layers/helpers.py
```
To address ImportError: cannot import name 'container_abcs' from 'torch', change <br>
import container_abcs from torch to <br>
import collections.abc as container_abcs <br>
and add int_classes = int
```
vim /home1/science103555/.conda/envs/convnextv2/lib/python3.8/site-packages/timm/models/layers/helpers.py
```
To address ModuleNotFoundError: No module named 'torch._six', change <br>
from torch._six import inf to <br>
from torch import inf
```
vim /home1/science103555/ConvNeXt-V2/utils.py
```
To address ImportError: cannot import name 'MinkowskiConvolution' from 'MinkowskiEngine', change <br>
from MinkowskiEngine import ( to <br>
from MinkowskiEngine.MinkowskiEngine import (
```
vim /home1/science103555/ConvNeXt-V2/models/fcmae.py
```
Pip install MinkowskiEngine
```
pip install -U git+https://github.com/NVIDIA/MinkowskiEngine -v --no-deps --config-settings="--blas_include_dirs=${CONDA_PREFIX}/include" --config-settings="--blas=openblas"
```
Remove commands:
```
conda deactivate
```
```
rm -rf ConvNeXt-V2/
```
```
rm -rf .conda/envs/convnextv2_cuda_12_1_1/
```

