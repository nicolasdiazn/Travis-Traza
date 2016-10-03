using Base.Test

function random_state(dim=2::Int)
    v=randn(1,dim)+randn(1,dim)im
    v=v/norm(v)
    return v'
end

# Vectorizado
"""
Traza parcial 
"""
function partial_trace_pure_bipartite_mat(state,dim,system)
    dimtotal=length(state)[1]
    dimcomp=Int(dimtotal/dim)
    if system==1
    psi=reshape(state,(dimcomp,dim))'
        return psi*psi'
        elseif system==2
     psi=reshape(state,(dim,dimcomp))'
        return psi'*psi
    end
end

#Elaboramos los estados A y B, para luego utilizar la función kron con ellos.
state_A=random_state(2)
state_B=random_state(4)
stateAB=kron(state_A,state_B);

#Verificamos la tarea
trace(partial_trace_pure_bipartite_mat(stateAB,2,1));

@test trace(partial_trace_pure_bipartite_mat(stateAB,2,1))==1
