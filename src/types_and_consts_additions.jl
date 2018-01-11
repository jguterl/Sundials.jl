# These are the additions to the types_and_consts.jl file not from clang.jl

function Base.convert(::Type{Matrix}, J::DlsMat)
    _dlsmat = unsafe_load(J)
    # own is false as memory is allocated by sundials
    unsafe_wrap(Array, _dlsmat.data, (_dlsmat.M, _dlsmat.N), false)
end

CVRhsFn_wrapper(fp::CVRhsFn) = fp
CVRhsFn_wrapper(f) = cfunction(f,Cint,(realtype,N_Vector,N_Vector,Ptr{Void}))

CVRootFn_wrapper(fp::CVRootFn) = fp
CVRootFn_wrapper(f) = cfunction(f,Cint,(realtype,N_Vector,Ptr{realtype},Ptr{Void}))

CVQuadRhsFn_wrapper(fp::CVQuadRhsFn) = fp
CVQuadRhsFn_wrapper(f) = cfunction(f,Cint,(realtype,N_Vector,N_Vector,Ptr{Void}))

IDAResFn_wrapper(fp::IDAResFn) = fp
IDAResFn_wrapper(f) = cfunction(f,Cint,(realtype,N_Vector,N_Vector,N_Vector,Ptr{Void}))

IDARootFn_wrapper(fp::IDARootFn) = fp
IDARootFn_wrapper(f) = cfunction(f,Cint,(realtype,N_Vector,N_Vector,Ptr{realtype},Ptr{Void}))

KINSysFn_wrapper(fp::KINSysFn) = fp
KINSysFn_wrapper(f) = cfunction(f,Cint,(N_Vector,N_Vector,Ptr{Void}))
