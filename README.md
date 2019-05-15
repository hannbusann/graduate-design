# graduate-design
一些和毕业设计相关的文件和知识

# IMU 启动方法
- 接线按照mac系统下arduino IDE中 lab_2sensor_version.ino连线
- 需要修复内存溢出的问题
- ubuntu下需要使用/home/fw/lab/lib_2sensor_ros_version/的程序到单片机上面
- 跑ros节点需要使用这句`rosrun rosserial_python serial_node.py /dev/ttyUSB0`
- 单个消息的信息收取和处理用这里`/home/fw/lab/catkin_ws`的IMU_listen

