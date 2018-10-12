#State for installation/configuration of Salt Master
#Written by Brandon Watterson 10-11-2018
saltmaster_config:
 pkg.installed:
  - name: salt-master
 service.running:
  - name: salt-master
  - enable: True
  - require:
    - pkg: salt-master
  - watch:
     - pkg: salt-master

firewalld_public:
  firewalld.present:
    - name: public
    - ports:
      - 22/tcp
      - 4505/tcp
      - 4506/tcp
    - prune_ports:
      - True
