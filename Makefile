# ####################################
# MakeFile for ImageNet with MobileNetV2
# ####################################

test:
	CUDA_VISIBLE_DEVICES=0 \
	python3 main.py \
	--eval True

# ####################################
# Training
# ####################################
train:
	CUDA_VISIBLE_DEVICES=0,1 \
	python3 main.py \
	--model convnext_tiny \
	--batch_size 384 \
	--epochs 300


