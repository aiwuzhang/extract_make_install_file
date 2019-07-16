import os,shutil

'''
def get_all(cwd, idir):

    get_dir = os.listdir(cwd)

    for i in get_dir:
        
        sub_dir = os.path.join(cwd,i)  
        des = os.path.join(idir,i)
        print "SRC:"+ sub_dir
        print "DES:"+ des
        if os.path.isdir(sub_dir):     
            if not os.path.isdir(des):
                os.makedirs(des)
                
            get_all(sub_dir,des)

        else:
            if not os.path.exists(sub_dir):
                shutil.copyfile(sub_dir, des)
'''  

def get_all(cwd,idir):

    get_dir = os.listdir(cwd)

    for i in get_dir:
        
        sub_dir = os.path.join(cwd,i)  
        des_dir = os.path.join(idir,i)
        if os.path.isdir(sub_dir):
            if not os.path.isdir(des_dir):
                os.makedirs(des_dir)
                   
            get_all(sub_dir,des_dir)

        else:
            
            fn = sub_dir[18:]
            base = fn.split('/')[0]
            if base in ["bin", "sbin", "include","share","lib"]: 
                src = "/usr/" + fn
                des = "/root/dpdk/ovs-install/" + fn
            elif base == "etc":
                src = "/etc/" + fn
                des =  "/root/dpdk/ovs-install" + fn
                print base
            else:
                pass
                
            if os.path.isfile(src):
                print src
                if not os.path.isfile(des):
                    shutil.copyfile(src, des)
            else:
                print "NO " + src
                
if __name__ == "__main__":

    get_all(r'/usr/local/ovs2.9', "/root/dpdk/ovs-install")
    os.makedirs("/root/dpdk/ovs-install/bash_completion.d")
    shutil.copyfile("/usr/bash_completion.d/ovs-appctl-bashcomp.bash", "/root/dpdk/ovs-install/bash_completion.d/ovs-appctl-bashcomp.bash")
    shutil.copyfile("/usr/bash_completion.d/ovs-vsctl-bashcomp.bash", "/root/dpdk/ovs-install/bash_completion.d/ovs-vsctl-bashcomp.bash")
