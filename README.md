# nemo_apptainer-workflow
autosubmit workflow to run a home made NEMO apptainer
# singularity_autosubmit

To have autosubmit available on my machine 
```
conda create -n python3.9 python=3.9
conda activate python3.9
pip install autosubmit==4.1.8
```
To run the workflow then:

```
autosubmit expid   --description "NAME OF MY TEST"   --minimal_configuration   --git_as_conf autosubmit_conf  --git_repo https://github.com/sparonuz/nemo_apptainer-workflow.git --git_branch main 

```