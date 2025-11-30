# 创建工程
create_project SingleCPU ./SingleCPU -part xc7a100tscsg324-1

# 添加 RTL 源文件
add_files ./SingleCPU.srcs/sources_1/new/

# 添加约束文件
add_files -constraints ./SingleCPU.srcs/constrs_1/new/SCPU_Top.xdc

# 添加 IP
add_files ./SingleCPU.srcs/sources_1/ip/dist_mem_IM/dist_mem_IM.xci

# 获取 IP 对象
set ip [get_ips dist_mem_IM]

# 设置 COE 初始化文件
set_property CONFIG.Memory_Init_File "./TestBench.coe" $ip


# 设置默认库
set_property top SCPU_Top [current_fileset]