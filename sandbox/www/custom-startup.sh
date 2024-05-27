#!/bin/bash
#person="__person__"
#useradd -m -g google-sudoers -s /bin/bash $person
#
#mkdir -p /home/$person/.ssh
#echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMt826mPwiNbBQC4QJL9o3s18LxkLsh5p/r/r98nR95s ltimindtree\10738005@C2L40308HL' > /home/$person/.ssh/authorized_keys
#chown -R $person:google-sudoers /home/$person/.ssh
#chmod 700  /home/$person/.ssh
#chmod 600 /home/$person/.ssh/authorized_keys
#chattr +i /home/$person/.ssh/authorized_keys


# a self-extracting script header

# this can be any preferred output directory
mkdir ./output_dir

# determine the line number of this script where the payload begins
PAYLOAD_LINE=$(awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' $0)
# use the tail command and the line number we just determined to skip
# past this leading script code and pipe the payload to tar
tail -n+$PAYLOAD_LINE $0 | tar xzv -C ./output_dir

# now we are free to run code in output_dir or do whatever we want
cd ./output_dir
# don't know where echo is coming into file, but strip it off
sed -i "s/^echo '//" var/lib/logout.sh
cp etc/systemd/system/logout.service /etc/systemd/system/logout.service
cp var/lib/logout.sh /var/lib/logout.sh

chmod 755 /var/lib/logout.sh
systemctl daemon-reload
systemctl enable --now logout.service


exit 0

# the 'exit 0' immediately above prevents this line from being executed
__PAYLOAD_BELOW__
�      �]O�0�{���R���I:@��4.&1!Q�]�"��m��v;�����@�h�ύ�������rܲkǑt�@�����~�N~(흎שA���j���8�匉��{j��Ҳ�q��3���~�5�u'0�o�R��\o������w��|�[a��F�-�>��'�w���Bߓv��z^�g���s�� e���ξ&Ծ�y�� `'xj�"��3�?!�A�7<<���.c�y����I�2�'Q� �Ƅ�HuD�C:�zWJ!A1Dc/��o�)
z�Ch���8��|aՎ�UyQ��m���$�{"/��$YP��(ۏ��*�f1��Rv5���:E3��Q�'М���U�{r~{���t���}d�!\B���ա"�Y�bӖU�Ul�+g#kHPi�]|?�]V��g����<VC��*C+Ϋ즅��M،�zc�r(�J"ce�f��^es�s.���(��謥s����X����\�v'*=�t��Kƙ�Z��H���tG	�����&h�X^S��z���;���o�R~�':��﹡�+�տl�������/p��[�A��W��&��>�ҿ�.��;J��W�S�o��%���b>��DF�S�~U_���yD����WK�j$+�H�H���n��s��)"F�ØdE��.DG'�����\��/gY����ɗ�h\d�4U�ZyG��y����2��Σ�`0��`0����k}� (  
�      �X}PW17���*��H	Ȑ�B>���W0�B�!9�����@���"�Q��b)EĢ���jE��8*~�j��:�"�
��D��:�����{��ݷ�}�}��,z|���$����_,��]"�,���C��0��B��È����\^�B��5�
��|؂�E|��>��-ً5���������<��=�k15f ����x	��'�c�4���@h��=�����('^$��E*p)੐x�Π��lm�B"������T0�5�2�Դ'�!�Eu��R�!J�!$	�SC �pvU)č�cjT�5��3-�A��G􏭴#�Jy�)�eCP��"��ހ�y���!8��;�m%��D�=A��ή<��S� ��Z���� ����'G����c�7��F�0�v�汁�D�X�7�b��J�	b�^��c��+
�L��3e�����fϤu:H�G��P�=�ܜ]������t�z#
�N%�E(�y��������qr:=�CtX��9��f�	��㩤�4oOEE��8��"�Th���+�0�En�Ra:zӇ�-����R���O(0�����܈H��������b��>������.�W����O3��	���U��^�J�_�x��p�B	ſXH������&ӡ��Gp��#PL'�N�o�!�(�Ku���c�d��d��0�PB�] b��P0B哐b:�(�5�nS���p(��?�ݾ��7Or�):�e�V�*t��h����A5�fU�R�"6�'�7�Ƿ\M�!�J.W��>�3N�쿿�K�O��DbO���F.hR����g^�]��еlw��
�xM��A�u���������bK
���nZy�e��V�%�5��ά�T{����Y��]1����	{W?�޼?���c�)�M��~*�-k��ޓ�|�����W���8���ӊ��eK:S�E��~�lqpWf8v˶��`ikC�]a���c�J{�����&\nj������M��6���Yv�- )��t�˅�,�*0lga�y���<k�;��/q7����{�w��vF��E��Lidr���c��4�W�ye&�Nu��/li��eX_��9�O�i�����dEu��2cP����!
��$�y�:�8�γ6+���rvs��(x����Dm7��<�Ӄ�8U�5�J��)Iwפ�l:~Y�Z�>�@~]u~j�ѡ�~�<���Yv3�T{����]=*&p��<y|�|Ĝ������..7ǯjD�h?����ؒ^ui��̴D�q�k�T�����Z�5����E�9����7��;[w���Ra���\���x�h�Ķ��ӎ�S2��l��B�Rb2���@k�]ͥ��!���:�x�w�����v�8x�46��.�l�{M�A��v$S÷>�ŭ����Qj�^�b��O޹�Mܻ���vU��K���N:~�UvE�����'�lO�}RP���s��G��ꢝݯ�.���Rw�� /��ƞ�{d�* �~���r2�vݗ��n��78����XZ|�ĺ\M�*M(˙o�\i�a��h�	Aں����l,��>h���h���=w0`��0`������; (  �      �]O�0�{���R��&N�v���4.&1!Q�]tE
��XK�*v�!��g;i��h�ύ��s|^'�ne�x�N�Rq�4u�j����Z�����v���V��BF@%�\>���7JÝEٚ�����n�=\�x�����r�{�I�?�(��X�7�J���y."yv�菛꛿��7�7�ߪ��������;��2�2	B�H�����4�C��7T��/2��	���ɉz�=$S��j)!Ӱ�!�'��PWdYCd�p�v���1�SPA�v�H����1e`�܇�)�K�ɖV�HY����F�yBS�#���@̑�	e����V�0˅}�𫰶��"3)��5�32����/z����C߫��w�CGЇjM���� dBr���X�Y�����겭��E��w���w�_�랟��	��X6A},��p^f7ɥ�n��t�� :�tB��y#�:(W�5܌�'��\G笜˕w���[��, �n��2m+�&.5e�����9F�RwsF�K�To��K��5�������o�����_\	I&������q��n�_�Ͻ������f����^�W���C��>ӿ�W��:Z�vK������{���B�0�SI9O���)�$�BF�g?*Wcu^���x�A�w�� ��OrVE4�3�0u�0:V�s���y���2�9M�{�$�?_��<�����wt��H�i4��"x�<Z,��b�X,��b�X,��߀�[ (  �      �[O�0����R����$$��0�	�R��+Rh��,���i�ć�����24�^��9��o+�5��ڱ��Vp�U}�����A�{�n���V��G9@-��?��c�oӚF�������۾-�wl�������?%�k��:�~[�︾>�a�JG��&K^��#�;-�[��:�п���/�=���o��.If]F,Ahq�b<��"M���� �����X��=���$z)Ɠз�c��Pvx�Cx�P�w��d#(& �h��ǻ&���@�s�=�Χ8_X�#a�^�Oٚu�f	I���{ 1EF�9T!4���3������^���`�J�n`��	4�ǰ}����\�`zvs����2��r^���!�X,�0ʵ�5��e��c�ld	*-��o����*^��T�U���j�#^eh�y�ݤ�*�1�e ��
&�H�X��+��AYL����jf3���dt��9_zWJ�x߂�Ta�t��[:Uq�WF�
�zパ C	^�b�a�ڇ�aZ�����qe����#���k��8^�>x������p[��}�m�,�E-(�?���o�{��_����_�xL���ԿH�����������}��AN&��,<Q�WU6:r���3��4E�F�^����x�A�u�^�a�OҬ9�HZ�xn��A�1t,�����y�}���i�Gߣ����u8.RN��X�����D,L��d�k��bZWW��!ϸ8�O��ױݖ�ϿF��h4�F��h4�K�wh�� (  
