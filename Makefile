# ####################################
# Training
# ####################################
pretrain:
	CUDA_VISIBLE_DEVICES=2,3 \
	python3 main_pretrain.py \
	--data_path '/home1/dataset/ImageNet/' \
	--output_dir '/home1/science103555/ckp_weight/convnextv2_imagenet/'


