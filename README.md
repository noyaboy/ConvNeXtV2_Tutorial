# ConvNeXtV2_Tutorial
Refered to https://github.com/facebookresearch/ConvNeXt-V2
# Installation

We provide installation instructions for ImageNet classification experiments here.

## Dependency Setup
Create an new conda virtual environment
```
conda create -n convnextv2 python=3.8 -y
```
```
conda activate convnextv2
```

Install [Pytorch](https://pytorch.org/)>=1.8.0, [torchvision](https://pytorch.org/vision/stable/index.html)>=0.9.0 following official instructions. For example:
```
conda install -c conda-forge -c defaults -c nvidia cuda==11.8.0
```
```
pip install torch==2.3.0+cu118 torchvision==0.18.0+cu118 -f https://download.pytorch.org/whl/torch_stable.html
```
```
ssh -T git@github.com
```
If meet Permission denied(publickey), according to the instructions on this webpage: https://blog.csdn.net/qq_38825788/article/details/125859041, authorize the GitHub account.
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
Then, Install MinkowskiEngine:

*(Note: we have implemented a customized CUDA kernel for depth-wise convolutions, which the original MinkowskiEngine does not support.)*
```
cd ConvNeXt-V2
```
```
git submodule update --init --recursive
```
Then, Fix the Possible Error "Fatal: Needed a Single Revision"  by https://phoenixnap.com/kb/git-pull-submodule
Clone this repo and install required packages:
```
vim .gitmodules
```
```
branch = main
```
```
git submodule update --recursive --remote
```
```
cd MinkowskiEngine
```
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
Then, to address ModuleNotFoundError: No module named 'torch._six', change <br>
from torch._six import container_abcs to <br>
from torch import container_abcs
(In vim mode, press i to enter insert mode, press esc to exit insert mode, and enter :wq to save and quit.)
```
vim /home1/science103555/.conda/envs/convnextv2/lib/python3.8/site-packages/timm/models/layers/helpers.py
```
Then, to address ImportError: cannot import name 'container_abcs' from 'torch', change <br>
import container_abcs from torch to <br>
import collections.abc as container_abcs <br>
and add int_classes = int
```
vim /home1/science103555/.conda/envs/convnextv2/lib/python3.8/site-packages/timm/models/layers/helpers.py
```
Then, to address ModuleNotFoundError: No module named 'torch._six', change <br>
from torch._six import inf to <br>
from torch import inf
```
vim /home1/science103555/ConvNeXt-V2/utils.py
```
Then, to address ImportError: cannot import name 'MinkowskiConvolution' from 'MinkowskiEngine', change <br>
from MinkowskiEngine import ( to <br>
from MinkowskiEngine.MinkowskiEngine import (
```
vim /home1/science103555/ConvNeXt-V2/models/fcmae.py
```
Pip install MinkowskiEngine
```
pip install -U git+https://github.com/NVIDIA/MinkowskiEngine -v --no-deps --config-settings="--blas_include_dirs=${CONDA_PREFIX}/include" --config-settings="--blas=openblas"
```
Remove
```
conda deactivate
```
```
rm -rf ConvNeXt-V2/
```
```
rm -rf .conda/envs/convnextv2/
```

