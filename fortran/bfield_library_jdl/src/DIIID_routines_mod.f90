!-----------------------------------------------------------------------------
!
!   Routines/modules related to DIII-D
!
!   Contains:
!     Subroutine build_d3d_ccoils_jl
!   
!-----------------------------------------------------------------------------
Module DIIID_routines_mod
Use kind_mod
Implicit None
Contains

!-----------------------------------------------------------------------------
!+ Builds the d3d c-coil set as series of current filaments
!-----------------------------------------------------------------------------
Subroutine build_d3d_ccoils_jl(taper,ntorpts,coil,current,ncoil_pts)
!
! Set up so TAPER can be taken directly from curntic in diiidsup.in
!
! Description:
!  Builds the coil geometry and sets the current (in Amp-turns) for 
!  the 6 D3D C coils. A single loop is returned for each entire 
!  coil set, with one turn per coil. Output can be used in bfield_bs_jdl, bfield_bs_cyl, etc.
!
!  Coils 1:6 --> C79, C139, C199, C259, C319, C19
!    Coil toroidal angles are in RH cylindrical coordinates, so negative
!    of machine geographical toroidal angle.  <-- Following M. Schaffer routines
!
! Input:
!  taper : rknd(6) : The coil currents in Amps.  Number of turns (4) is applied in the routine
!  ntorpts : iknd : number of toroidal points used to generate the coils.  (4 was used in Shaffer's routine)
!
! Output:
!  coil : rknd(ncoil_pts,3) : Array of coil filament beginning and end points,
!                             in Cartesian coordinates (m), second index is (1,2,3) = x,y,z
!  current : rknd(ncoil_pts) : The current (in Amp-turns) corresponding to the current filaments. 
!                              The filament defined from coil(i,:) to coil(i+1,:) has a current
!                              set by current(i). The last value of array current is not used.  
!  ncoil_pts : iknd : number of coil points
!
! Calls:
!
! History:
!  Version   Date      Comment
!  -------   ----      -------
!   
! Author(s): J.D. Lore
!  -- Built on code by J.M. Canik and M. Schaffer
Use kind_mod
Implicit None

Real(rknd), Intent(in) :: taper(6)
Integer(iknd), Intent(in) :: ntorpts
Integer(iknd), Intent(out) :: ncoil_pts  
Real(rknd),Intent(out) :: coil(6*(2*ntorpts+1),3),current(6*(2*ntorpts+1))

Integer(iknd) :: npts,nturn,i,j
Real(rknd) :: phicens(6),phiext,R(2),Z(2),phi(ntorpts),taper2(6)

Real(rknd),parameter :: pi = 3.14159265358979323846_rknd 
!- End of header -------------------------------------------------------------

npts = 2*ntorpts + 1
ncoil_pts = 6*npts

! Coils are approximately rectangular.
phicens = (/-79.d0,-139.d0,-199.d0,-259.d0,-319.d0,-19.d0/)  ! Center of each coil
phicens = phicens*pi/180.d0
phiext = 58.d0*pi/180.d0               ! Toroidal extent of each coil
R = (/3.23d0,3.23d0/)                          ! Major radius of coil
Z = (/0.8d0,-0.8d0/)                     ! Vertical extent of coil.
nturn = 4

coil = 0.d0
current = 0.d0

taper2 = real(nturn,rknd)*taper

Do i = 0,5
  Do j = 1,ntorpts
    phi(j) = phiext*real(j-1,rknd)/real(ntorpts-1,rknd) + phicens(i+1) - phiext/2.d0
  Enddo
    coil(i*npts+1:i*npts+ntorpts,1) = R(1)*cos(phi)
    coil(i*npts+1:i*npts+ntorpts,2) = R(1)*sin(phi)
    coil(i*npts+1:i*npts+ntorpts,3) = Z(1)
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,1) = R(2)*cos(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,2) = R(2)*sin(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,3) = Z(2)
    coil((i+1)*npts,:) = coil(i*npts+1,:)
    current(i*npts+1:(i+1)*npts) = taper2(i+1)
    current((i+1)*npts) = 0.0d0   ! Sticks connecting the coils have no current.
Enddo

End Subroutine build_d3d_ccoils_jl


!-----------------------------------------------------------------------------
!+ Builds the d3d i-coil set as series of current filaments
!-----------------------------------------------------------------------------
Subroutine build_d3d_icoils_jl(taper,ntorpts,coil,current,ncoil_pts)
!
! Set up so TAPER can be taken directly from curntic in diiidsup.in
!
! Description:
!  Builds the coil geometry and sets the current (in Amp-turns) for 
!  the 12 D3D I coils. A single loop is returned for each entire 
!  coil set, with one turn per coil. Output can be used in bfield_bs_jdl, bfield_bs_cyl, etc.
!
!  Coils 1:12 --> IU30, IU90, IU150, IU210, IU270, IU330, IL30, IL90, IL150, IL210, IL270, IL330
!    Coil toroidal angles are in RH cylindrical coordinates, so negative
!    of machine geographical toroidal angle.  <-- Following M. Shaffer routines
!
! Input:
!  taper : rknd(12) : The coil currents in Amps.  Number of turns (1) is applied in the routine
!  ntorpts : iknd : number of toroidal points used to generate the coils.  (6 was used in Schaffer's routine)
!
! Output:
!  coil : rknd(ncoil_pts,3) : Array of coil filament beginning and end points,
!                             in Cartesian coordinates (m), second index is (1,2,3) = x,y,z
!  current : rknd(ncoil_pts) : The current (in Amp-turns) corresponding to the current filaments. 
!                              The filament defined from coil(i,:) to coil(i+1,:) has a current
!                              set by current(i). The last value of array current is not used.  
!  ncoil_pts : iknd : number of coil points
!
! Calls:
!
! History:
!  Version   Date      Comment
!  -------   ----      -------
!   
! Author(s): J.D. Lore
!  -- Built on code by J.M. Canik and M. Schaffer
Use kind_mod
Implicit None
Integer, Parameter :: nc = 12
Real(rknd), Intent(in) :: taper(nc)
Integer(iknd), Intent(in) :: ntorpts
Integer(iknd), Intent(out) :: ncoil_pts  
Real(rknd),Intent(out) :: coil(nc*(2*ntorpts+1),3),current(nc*(2*ntorpts+1))

Integer(iknd) :: npts,nturn,i,j
Real(rknd) :: phicens(nc),phiext,R(2),Z(2),phi(ntorpts),taper2(nc)

Real(rknd),parameter :: pi = 3.14159265358979323846_rknd 
!- End of header -------------------------------------------------------------

npts = 2*ntorpts + 1
ncoil_pts = nc*npts

! Coils are approximately rectangular.
phicens = (/-32.7d0,-87.3d0,-152.7d0,-207.3d0,-272.7d0,-327.3d0, &
            -32.7d0,-87.3d0,-152.7d0,-207.3d0,-272.7d0,-327.3d0/) ! Center of each coil
phicens = phicens*pi/180.d0
phiext = 51.72d0*pi/180.d0               ! Toroidal extent of each coil
! 2003
R = (/2.184d0,2.394d0/)                  ! Major radius of coil  --- Upper coil, lower just invert and flip Z
Z = (/1.012d0,0.504d0/)                 ! Vertical extent of coil.
! 2006 'revised'
!R = (/2.164d0,2.373d0/)                  ! Major radius of coil  --- Upper coil, lower just invert and flip Z
!Z = (/1.016d0,0.504d0/)                 ! Vertical extent of coil.
nturn = 1

coil = 0.d0
current = 0.d0

taper2 = -1.d0*Real(nturn,rknd)*taper   ! -1 accounts for DIII-D convention

! UPPER COILS
Do i = 0,5
  Do j = 1,ntorpts
    phi(j) = phiext*real(j-1,rknd)/real(ntorpts-1,rknd) + phicens(i+1) - phiext/2.d0
  Enddo
    coil(i*npts+1:i*npts+ntorpts,1) = R(1)*cos(phi)
    coil(i*npts+1:i*npts+ntorpts,2) = R(1)*sin(phi)
    coil(i*npts+1:i*npts+ntorpts,3) = Z(1)
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,1) = R(2)*cos(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,2) = R(2)*sin(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,3) = Z(2)
    coil((i+1)*npts,:) = coil(i*npts+1,:)
    current(i*npts+1:(i+1)*npts) = taper2(i+1)
    current((i+1)*npts) = 0.0d0   ! Sticks connecting the coils have no current.
Enddo
! LOWER COILS
Do i = 6,11
  Do j = 1,ntorpts
    phi(j) = phiext*real(j-1,rknd)/real(ntorpts-1,rknd) + phicens(i+1) - phiext/2.d0
  Enddo
    coil(i*npts+1:i*npts+ntorpts,1) = R(2)*cos(phi)
    coil(i*npts+1:i*npts+ntorpts,2) = R(2)*sin(phi)
    coil(i*npts+1:i*npts+ntorpts,3) = -1.d0*Z(2)
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,1) = R(1)*cos(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,2) = R(1)*sin(phi(ntorpts:1:-1))
    coil(i*npts+ntorpts+1:i*npts+2*ntorpts,3) = -1.d0*Z(1)
    coil((i+1)*npts,:) = coil(i*npts+1,:)
    current(i*npts+1:(i+1)*npts) = taper2(i+1)
    current((i+1)*npts) = 0.0d0   ! Sticks connecting the coils have no current.
Enddo


End Subroutine build_d3d_icoils_jl


End Module DIIID_routines_mod