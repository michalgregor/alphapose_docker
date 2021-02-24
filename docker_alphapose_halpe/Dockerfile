FROM michalgregor/alphapose:base
WORKDIR /alphapose-repo

RUN mkdir -p detector/yolo/data/ && \
    gdown --id 1D47msNOOiJKvPOXlnpyzdKA3k6E97NTC --output detector/yolo/data/yolov3-spp.weights
RUN mkdir -p pretrained_models/ && \
    gdown --id 17vnGsMDbG4rf50kyj586BVJsiAspQv5v --output pretrained_models/halpe136_fast_res50_256x192.pth

# run generation once on the examples to make sure that all necessary assets have been downloaded
RUN python3 scripts/demo_inference.py --cfg configs/halpe_136/resnet/256x192_res50_lr1e-3_2x-regression.yaml --checkpoint pretrained_models/halpe136_fast_res50_256x192.pth --indir examples/demo/ --save_img
# clear the generated results
RUN rm -r examples/res/*

WORKDIR /alphapose

