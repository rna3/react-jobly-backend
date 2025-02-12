PGDMP         :                }            jobly %   14.15 (Ubuntu 14.15-0ubuntu0.22.04.1) %   14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    172069    jobly    DATABASE     V   CREATE DATABASE jobly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE jobly;
                linuxryo    false            �            1259    172107    applications    TABLE     o   CREATE TABLE public.applications (
    username character varying(25) NOT NULL,
    job_id integer NOT NULL
);
     DROP TABLE public.applications;
       public         heap    linuxryo    false            �            1259    172071 	   companies    TABLE     U  CREATE TABLE public.companies (
    handle character varying(25) NOT NULL,
    name text NOT NULL,
    num_employees integer,
    description text NOT NULL,
    logo_url text,
    CONSTRAINT companies_handle_check CHECK (((handle)::text = lower((handle)::text))),
    CONSTRAINT companies_num_employees_check CHECK ((num_employees >= 0))
);
    DROP TABLE public.companies;
       public         heap    linuxryo    false            �            1259    172092    jobs    TABLE       CREATE TABLE public.jobs (
    id integer NOT NULL,
    title text NOT NULL,
    salary integer,
    equity numeric,
    company_handle character varying(25) NOT NULL,
    CONSTRAINT jobs_equity_check CHECK ((equity <= 1.0)),
    CONSTRAINT jobs_salary_check CHECK ((salary >= 0))
);
    DROP TABLE public.jobs;
       public         heap    linuxryo    false            �            1259    172091    jobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          linuxryo    false    212                       0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          linuxryo    false    211            �            1259    172082    users    TABLE     9  CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_check CHECK ((POSITION(('@'::text) IN (email)) > 1))
);
    DROP TABLE public.users;
       public         heap    linuxryo    false            q           2604    172095    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          linuxryo    false    212    211    212                      0    172107    applications 
   TABLE DATA           8   COPY public.applications (username, job_id) FROM stdin;
    public          linuxryo    false    213   j                 0    172071 	   companies 
   TABLE DATA           W   COPY public.companies (handle, name, num_employees, description, logo_url) FROM stdin;
    public          linuxryo    false    209   �                 0    172092    jobs 
   TABLE DATA           I   COPY public.jobs (id, title, salary, equity, company_handle) FROM stdin;
    public          linuxryo    false    212   �)                 0    172082    users 
   TABLE DATA           [   COPY public.users (username, password, first_name, last_name, email, is_admin) FROM stdin;
    public          linuxryo    false    210   g;                  0    0    jobs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.jobs_id_seq', 400, true);
          public          linuxryo    false    211            }           2606    172111    applications applications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (username, job_id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public            linuxryo    false    213    213            u           2606    172081    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            linuxryo    false    209            w           2606    172079    companies companies_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (handle);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            linuxryo    false    209            {           2606    172101    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            linuxryo    false    212            y           2606    172090    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            linuxryo    false    210            �           2606    172117 %   applications applications_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_job_id_fkey;
       public          linuxryo    false    213    212    3195                       2606    172112 '   applications applications_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_username_fkey;
       public          linuxryo    false    210    3193    213            ~           2606    172102    jobs jobs_company_handle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_company_handle_fkey FOREIGN KEY (company_handle) REFERENCES public.companies(handle) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_company_handle_fkey;
       public          linuxryo    false    209    212    3191               3   x�+I-.)-N-�4�*�1��l#������K�K��p�9W� �'           x�mY�V�8|v�>�����ȭ�g�v8sN��l�-�%�$SS��������a$�e�2###�K=�0�u��1�8������hQ\��ʖC�T0�ڨl��7���w��J����;㝙?j�Cg�1�`L4�U^�QߍQ�U�A���'���l�Ii\RV�kmڨ�k�W���;ކ����j��]e�le���6�v���*�4�l�N�7W���ҷ�Z�J�>F�����T���y���>��żw��^�U�����K�g�S{eJ�|gK�W+e]�s�8T0�ݨF��F�����V����:��j1�Ǚ�Z��+x�֕����b�Z���h�s�d�N�N�?���['G������~E�#�����1O����w�F�&$�����s�p�J�3��F�qU#��x0�^L:���&$8˛���b�	�|��֕��8Q�0Y�>}��7�t��_;ذ4zHv5 ^e�}�z��2�յ��*X�5ڊk7�u�q�cR�`l�� � f&�b恘�|贛5:��Mq�g7y�㮸�W�e��U����d�|��{�����I��p���Z�J�=X$�0��[�Y�M53o�!h^�����8,@��Ǯ��h��\�y��oF�"1��F�ؙʖ�k��W<u֕b���:_1g�iDg��,X������2]����->��Ԩ�8��f	,��kc~�Ȟl����m�cY3C�!'�.��i]��"?ۇ+=������5��6s��^}/��o6�����Ź:�����M�;��+� 1��ۚ-�����z �ð�����:.gGǇ��� ��]G��A�:�X����b�¸���CDt@U$aD�p���kxaJ]%��莹�.M�K8zK��h�L��Q+���u�e��6?Z£�Yz�?v�XR}#u!z5q��`��F�G��͚��Q��`���@j�%�#�V`ԓ��"�p_��L�/����ȅ#P�=��j ��[3�i%��{�يg )��ޣ^awG�������.;ݼ?;@�U���9��qNbH�yc)!�kp���iW|��K��D��u^�\��S�p[���P�fK|v&dY�g����e],|�����X)�Z'՛�2ɝi��܋G�hg?��4р���{�|�d�U���mR�w�����KK�Ԡ�-����M��L�j�(���L�m7�3��\T<}iM���3I����ګ��j%�G0R3k۲x�H}�~Q��.e�Iѓ�l�ggp�
Ԍ�F���AdE��C�Z0lq����`���}7Qy�l��×(-��$���8�W!U)�� ��s���Si�l�d>e�7���@�T<�lG�9Hp��P���K�]���'��fN�,�n���b�S����G���������N9�����V����4H>U�P��c�/1�f�)��4�3g���*"�P�W��1�M[,�� Ô��y���b��NS�2~l%�ޏ ��gE��i�ʜ��w��L/���Q��5��bV�f��t(�Ҋ>EU@]����ҷ�I���PT��⸸r�o:����;�C��GV8P �Y�����U���k|o�'����M�P��g�Lx�H2��pQ<KA	^4/
XaA^��R�>I�,g��Y�Z>����าѦeX8������Fޒ;"=H�XM�(cy����q�?|�l�>�+�e
&����L�!�0���S��Se�jefK%�WA�*]n������w	l�v��x�6�&&�:~���@:��V&�J�hXl�uM�5]��2K�A�W|CmS|���Ow���ܠH4Sq ���O גV�&Y,���Zh:�V��7�Rs�*̬G�o9R�����nq����W3a��j(}�U�,���z�?G�z���x�\� ��z�[=[�_�\q&��i�j��.�^��M�� ���F�N��ts��"#A�:�";��K[��l�X4�~:@X���\�3qX�BV����&Aw��z�t9�9u�e�w�Ց�eq��M�b䆓�^q��F��`���Ծ}�0آ�6����! � řP�v8�Fq�8�O������d>��Yi�4��Om����e;&�/�ٲ��֒v���~3��~4#�^S*9f�� ���<RcƼ��� �P�*i�f�H�q��;=���4�7�����;[�Ѩ!�Ao��W��}�U N�5%~B@i�|���e������2	Y#����%�Ԁ`6�Nq&�6p�8�������
M��k����ȋ#M|�GЯo�E[<�F,g�'�s�;�I�v�g�'�b"���9��^&#��Ǟʛ,�N.��ڮx�<}�g��ǒ��Z� lBMKN4���v V�I�j�*qc�g�:�! ��6UhA9T�1<��-.X�&){c`�R�X�N$:��˞u�8xi���֚�����f5����fw��*[13�b]�m�-�2�cmS��v���i-��~��7y(���������Hp[z׎���
.5m)����ޢ����@yύ$,�V�!�R��]���Q�����l�iG]���#���t��a'p/��ٖ"���P��k-����1w�T�rK#��CS"�JKI��22�X�E?N/��@�&77[���`���O2����s�_�-/���� E��� �X��M�fk�R����G����sذ����z���+���O�v��?�!?5ȕ��Ɍ0̈,xv�\iD'[z��H�*忸g"���Eq�+��
>ߏ��N�*�+f��
�E��>���{����\q�p>)��o3�O��s�Z���W-	�!;J��}���7g/`�Ȟ�m7W����*�s�5��&�Z-�Ml��ְ<l �6F7���-/��t��.Y�;�-wr�K��{oe�8:*.�&j�����dhbP�]���ه�	���P��n���d-E��f��m�,��X�
$?9���Á�Ṱ��0�n�G��dc*]�����7��������SC�	��� [�-�F�X�-��-��<O��Nњ���`>5��{'��t�^�a"��	9P4C\����4���e����X(��E��w�߲<�ߡ�� �nƉ4KG�'E�ԓ��!�����'F=Q���!cV�T�JBȔ����u+�Fw�d"7�Z�q-k���[}>�;9A�(1���%m��Ԝز�M���� �u��Q&�\���Ʌ:��c��#��ҧ��g�\~��~ȿL]S��oG]WZ����|���˗/��tB            x��Z˒�6]C_��$UV� ���I<��JbO�lfQh�6Ej@�;���H���"����	�>�=��P�SYTR=��T��FY�(I(���ɳ���Xn�SV-�w�X���������,��0�[�y��gy^-�yq��Y����)�=Yl�Bb}�-�d�KU-��(�z�"�ʏ�Q
Uy�����]|�J�m^.�"�9j<�me�JO"?V5��v�V�B*,NwB拐|nԓ<���,��L��V�b�TU���W�L.ӲPb�����,��V�G�A�~QlpnXE�LT�}�T�����kU�8��ˊ�V�^uk���4���E����l��|ڕu�U�/M��]c�����7mн�d�;(�z�7�Ywo%vb�����E!���6Ϫ�'*Oxp�̶�������Д�B�$�
��ʫ�(�C�jo��/$Ꜫ�'�*����SuLwe^n��~�yf�	t�5mƬ���gV�"�`�NW�3uޯ�1/���,s�;�s�����FE��$��XV5ܯ���i����W<Gh��h��K%����]�8�w�&�g�Mc�a���p3�"4!����*{~tqX�e]/�}V��'_�F�g�ѐp)Q�7y�ߗQ�*+�	�J����
^7�g��wp�'s�D5J�A���[a����;��������<�QF�k���u�j� �7�:O({�zW�a$� n���J�֖M:;���f)��^�ߐ��H&YyJ��ڜ{±Y绯"�fQ,:�sy\��!���@S���y��A�����"Nv��y��	f�	Nh�]d/�"�ZOjP[���(�v�6=�����|�^p��ZV����F�C8a_�CnHv��E�-�����,j��o�G�m4��(�<�:vH\��M ��-2sI�\΁5�l�zO��桮N��]�._i�1�Ը��}Yxp����\�tl�6Mj�(�g��z�5b�EHާi�z�c-䇪��v�Qp��^�s^!��}	�~gh�h�L_#_q�������1ѽ�P�8 �0���$4���߉�Gd�F㼔��O~oT%��Q��\��?�[�k���1 ��0��w޾�GY�-�y���G�o���uV.Vl�v��0�Ԇť��}(�no�����ҺBV[D}���]����(Yý*���X�JQ��O�A�~.�*�<�$��Цc�L�
SWy�$)�����֌�J��[#��O�gY,��@Z��H�m��ۅ'�|�~�#�ҹ ڈ��_2m:��\�(��9j�d�P�ʑ�U���w�C��zp�D� \�;Yl�B��<`W����h�؊�& ?w����mР}�i1B���F!���ߧm�l M�Ҟr���\n�q*]�x[�ˢܪ�v��KO11HN�FOh�C���|��U�b7*`���)P��-j�`!�6��%8dxs�Y�պ�F\�!�Sc��>�����|�8����H�5��Q!����~iaH~H���A����K ��(�8P����3�[�ʣsBƈ�#-��!�(p���sӯ:��'6�id�b+��<�Q
�� ci˖�l䮈���Csk��D�U�DBO�;b䧼�w��Z�Ug��e�?�@qcr�'�e���=��%��.'k��Zɬ�ih�#�@i��o��J<8��(�;�dA�PLO�<
�͔�yg	�$�;gIEW*~���s"�hu��F^���@,������Ò1��P��s���D)��-�o��at�L��j�X_�a�)�z�Kξ4�:H]L]���ۍ��4�C�k��V̧��K����+�I���C�8ܕؐo9Q�������bjh���!}$q�_v�8|��Y@0a��8"�w�T����Ĭ�Q�]�cwGdr��0N��8!�3�b��B�R�GLt�%�S�;����2�ړ<H4��=����NT�n����e�H��+�!�P��]?b}���;)��f
��x$�R�r�r�"��5 �˳��e��[e�MNr'	ȟ*3Ȁ1�J��QT;��!���֣|�^�O��`�:^����x�Z�H�U3� c'��J-�U�ջ�у6�$��>�ܦY[��uи<g[�P�|D'�hL�-�����i]��X�w�C	K0`��˧>��Ensa�௮|K�]~�\8!@#>N߶ �z�o��Q�m���!����t���2�<�fԏ^�����9i�ș6�	0�3��϶## ��]<D��(����&TM!W.J�0Au���۝�
���=a�M&�@�w:~�%��kJ�>U�&Է�L��C5�rY��~g�=�)��w���d_��,�́��u��o�~��(ɟ�d��}/�ϻ?J#�L�`��辮�����}�-���EY��xǬ��P
�H�(��j�Pue6�����y�.�h`q�E���2�t�M�\
ָ�\>�|�NhTi���[���ح}T��v�|ċ�ϵx|�g��_8k�r�Df���Z?�����|�v�W�8�L׫�	�mh�:^�D\���ڈ�+x�x��Y$��u�+1��,MCd���� ǁV����[��ڡ���_SY}��򐜗��p�$��^�s�䜿S�گ	"57K��O��9��Q}�jߊ8�Z�P���8���[@����<������<��ԖgZ=�`�=,�q��=f���)���i��	(O�?[V������S��GY���}���v����@4UV}�KY ��銑?��ux���"SN�e��� �ꡝ�b�#
�����
��P{��۶��x>JA�?�l?���C+{	��)����A/T/l &t�k��b��e�׵n�[Oc��7]�ܖ��c)>sZ2�rh� ,ڔUB����gc���C^�v@�Dx��0�!
z�-AI9�!�oOy}WN~�G�r�?"6b� ���ꞿ=����Ț�˵-F���cA+v�0A��7�m�}�^ցRd�E�γG�B��3Gga�$I�V;>h��
0�Q��Qa�@�O;@��s:H�!��gb^�u��k,��FSJxYO.���G��ӵ��ߋ�+�	����\����@ -����h?	�sc6��i7F7��c�qY	�'�Z���ӡ�y�6Va���J����LN��K	�GV��}=GTB4�(}4M�C:l5�Pp���bm:q���4b#@F�Ӣk�x\�H$��-B/h&���<��:��c�m��~l�Vz���&x���M��}�_�g4
uU_��Al'46c�Q�v��}�,�~�ig�g^���Q�����4J��xf:�9��WP��8�6@ 0'%	����gх�-�م�����cl��/v}�MZ }.7�1��Z�6��nI_��p �;�B��!���W�X�X��{�:%��
��ά
�y�J�fgJ5��V�ԙ�[�Dxs�����`���&N:J��Q���&���a�P݉Tv:Wp�
��Ӽ$n��y���� �]E���U+�p;Fp���[��8�<��r��EGDG��08���8����b���h��+��P��^��"0Z�=�v�] ��MV�uf�h����Ђ�i ���?{�Z�n��ȝ��bj�~_n����v�s�O'���ەv̟��c�����?Kq���;�ߣ�c�-�;6Ox��Ly�&K��4��"�c�wl���ݨ�c�x�f��{4x�DxTx7��&����ݮĻC�w���㱙j<v�����I�<6[���K��dM�]��nT�)�<6]��f��}�<6K���i�ؽ�<v�:��"�cS�yl�@�MP��%z�e��Y�Ǧ���-2=6G��n�iJ=6]��n��yb=6K������-z=6C��&)����I�����,��+�c�t{l�p��P�y�=6G�����}�=v�|���ﱩ>6C��fK���/�c�������cS�|�F%{c)���c�|l���͒�7�󱩂>6Oч�M ~  U��>~�������}�.E�����)���)��E�W���P��')��-�>>G��'+��E����}|����T��>>I��'(��E����}�E�I���H���^��g)����>>C��g(��$E����}|���OT��}|����T��)�>>A��'+��LE�����}|����R��{}|�������w*��TE����o���w(��lE�����}�E�����}|���OQ��)�>>S��g(��M�>>S�ǧ)���>>_�ǧ)��E�C��'*��<E����}|���ߥ��S}�}�^E����3}|����U���>~���ߨ��s}�EE�G��')��,E����+����b��?2
h           x���;o�0�����J��4�!RH�SRE]�5&���ſ�a���c��|���Ȳ��/0���X��[D0�64IHP����M� ��7��z?4�s��Yq���Ar���)�t%�L'SBv�ʻT���h	�N��?!i�[� nD����h�j~���-,cm]�Z;2Ђ����}�3�T$0�I~�� ��X`��M�	}z���a����D�iۉ�3P{妊��
Q4�G�D���[�P5�k"��#ؕ�aV�L�g��2��N�U     