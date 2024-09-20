$output_dir ="C:\Users\amcsween\Documents\GitHub\MicrogliaSet\MicrogliaConverted_Alex\Amoeboid_surface_new\separated";
mkdir $output_dir;
Get-ChildItem -Path C:\Users\amcsween\Documents\GitHub\MicrogliaSet\MicrogliaConverted_Alex\Amoeboid\*.swc -Recurse -Force -Filter *.swc | Foreach-Object{

$cellname = $_.BaseName; $path = Split-Path -Path $_;
echo $cellname;
cp $path/$cellname.wrl $output_dir/$cellname.wrl;
cp $path/$cellname.swc $output_dir/$cellname.swc;

# python fix_swc.py $path/$cellname.swc $output_dir;
python mesh_microglia.py $output_dir\$cellname --output_dir=$output_dir --min_faces=2000 --segment_meshes=1;

Remove-Item $output_dir/$cellname.wrl;
Remove-Item $output_dir/$cellname.swc;

}