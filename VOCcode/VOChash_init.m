function hash = VOChash_init(strs, dataset)

if nargin < 2
    dataset = 'VOC2012';
end

hsize=4999;
hash.key=cell(hsize,1);
hash.val=cell(hsize,1);

for i=1:numel(strs)
    s=strs{i};
    if strcmp(dataset, 'VOC2012')
        h=mod(str2double(s([3:4 6:11 13:end])),hsize)+1;
    else
        h=mod(str2double(s),hsize)+1;
    end
    j=numel(hash.key{h})+1;
    hash.key{h}{j}=strs{i};
    hash.val{h}(j)=i;
end

