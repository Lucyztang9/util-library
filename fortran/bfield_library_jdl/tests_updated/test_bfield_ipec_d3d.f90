!-----------------------------------------------------------------------------
!
! -- JDL
!
Program test_bfield_ipec_d3d
Use kind_mod, Only: int32, real64
Use gfile_var_pass
Use g3d_module
Use bfield_module, only: bfield_bs_jdl, bfield_bs_cyl
Use diiid_routines_mod
Use ipec_module
Implicit None

! Local variables (scalar)
Real(real64),Allocatable :: Btest(:,:),Rtest(:),Ztest(:)
! Local variables (array)
Character(Len=100) :: gfilename, fname, run_path

Integer :: ierr_b,Ntest,ierr,ifield_type

Real(real64),allocatable :: rmp_coil(:,:),rmp_current(:)
Real(Real64) :: taper(12)
Integer(int32) :: ntorpts,ncoil_pts
Real(real64) :: Bout(1,3)
Real(real64), allocatable, Dimension(:) :: Bx,By,Bz,P_x,P_y,P_z,Phitest,Br,Bphi

!- End of header -------------------------------------------------------------

run_path = '/home/jjl/IPEC/164723/low/gpec'
!fname = '/home/jjl/IPEC/164723/low/gpec/ipec_eqbrzphi_n3.out'
!Write(*,*) 'Reading ipec file:', fname
!Call read_ipec_field_file(fname,0)
Call open_ipec_fields(run_path)
ifield_type = 1

Call bfield_ipec((/2.1d0/),(/0.1d0/),(/0.05d0/),1,Bout,ierr,ifield_type)
WRite(*,*) Bout
Call close_ipec_fields

stop
gfilename = './g160884.03014_251'

Call readg_g3d(gfilename)

Write(*,*) 'Test call to bfield_geq_bicub'
Ntest = 2
Allocate(Rtest(Ntest),Ztest(Ntest),Phitest(Ntest),Btest(Ntest,3))
Rtest = (/1.8d0,1.8d0/)
Ztest = (/-0.5d0,0.5d0/)
Phitest = (/0.0d0,0.1d0/)

Write(*,*) '--------------------------------'
Write(*,*) '         TEST POINTS'
Write(*,*) 'R (m)',Rtest
Write(*,*) 'Z (m)',Ztest
Write(*,*) 'P (r)',Phitest
Write(*,*) '--------------------------------'

Call bfield_geq_bicub(Rtest,Ztest,Ntest,Btest,ierr_b)
Write(*,*) '                   Br        Bz        Bphi'
Write(*,'(a,3f10.4,i0)') 'And the answer: ',Btest(1,:),ierr_b
Write(*,'(a,3f10.4,i0)') 'And the answer: ',Btest(2,:),ierr_b

Write(*,*) 'building coils'
taper = (/-3740.d0, 3863.d0,-3720.d0, 3855.d0,-3718.d0, 3858.d0, &
           3862.d0,-3791.d0, 3884.d0,-3854.d0, 3923.d0,-3847.d0/)
ntorpts = 6
Allocate(rmp_coil(12*(2*ntorpts+1),3))
Allocate(rmp_current(12*(2*ntorpts+1)))
Call build_d3d_icoils_jl(taper,ntorpts,rmp_coil,rmp_current,ncoil_pts)

Write(*,*) 'Test call to bfield_bs_jdl'
Allocate(P_x(Ntest),P_y(Ntest),P_z(Ntest))
Allocate(Bx(Ntest),By(Ntest),Bz(Ntest))
Allocate(Br(Ntest),Bphi(Ntest))
P_x = Rtest*cos(Phitest)
P_y = Rtest*sin(Phitest)
P_z = Ztest
Call bfield_bs_jdl(P_x,P_y,P_z,Ntest,rmp_coil,rmp_current,ncoil_pts,Bx,By,Bz)

Write(*,*) 'Bx',Bx
Write(*,*) 'By',By
Write(*,*) 'Bz',Bz


Write(*,*) 'Test call to bfield_bs_cyl'
write(*,*) '  '
Call bfield_bs_cyl(Rtest,Phitest,Ztest,Ntest,rmp_coil,rmp_current,ncoil_pts,Br,Bphi,Bz)

Write(*,*) 'Br',Br
Write(*,*) 'Bphi',Bphi
Write(*,*) 'Bz',Bz


End program test_bfield_ipec_d3d
