module version
  implicit none

  contains

subroutine print_version

  write(*,*)
  write(*,'(6x,''* * * * * * * * * * * * * * * * * *'')')
  write(*,'(6x,''*           P l o t M S           *'')')
  write(*,'(6x,''* * * * * * * * * * * * * * * * * *'')')
  write(*,'(6x,''*    QCxMS spectra plotting tool  *'')')
  write(*,'(6x,''*         -  v. 6.2.0  -          *'')')
  write(*,'(6x,''*          26. Sep 2023           *'')')
  write(*,'(6x,''*           *   *   *             *'')')
  write(*,'(6x,''*           S. Grimme             *'')')
  write(*,'(6x,''*           J. Koopman            *'')')
  write(*,'(6x,''* * * * * * * * * * * * * * * * * *'')')
  write(*,'(6x,''   Contributor:  C.Bauer, J. Gorges, T.Kind   '')')
  write(*,*)
  write(*,'('' Special version for Linux (Debian, x86, pie, static) '')')
  write(*,'('' linked with high-performance BLAS and LAPACK libraries (for Android) '')')
  write(*,'('' tailored to run on x86_64 powered Android devices '')')
  write(*,'('' compiled by A. Liska & V. Ruzickova '')')
  write(*,'('' on April 16, 2024. '')')
  write(*,*)

end subroutine print_version
end module version
