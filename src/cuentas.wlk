object cuentaJulian {
	var saldo = 0
	
		method depositar(pesos){
			saldo += pesos * 0.8 
		}
		
		method saldo(){
			return saldo
		}
		
		method extraer(pesos){
			saldo -= pesos
				if(saldo - 5 < 0){
					self.error("No se puede dejar la cuenta con saldo negativo por este gasto")
				} else {
					saldo -= 5
				}
		}
}		


object cuentaPepe {
	var saldo = 0
	
		method depositar(pesos){
			saldo += pesos
		}
		
		method saldo(){
			return saldo
		}
		
		method extraer(pesos){
			saldo -= pesos
		}
}

object cuentaPapa {
	var saldo = 0
	var precioCompra = 14.70
	var precioVenta = 15.10
	
		method precioCompra(nuevaCotizacion){
			precioCompra = nuevaCotizacion
		}
		
		method precioVenta(nuevaCotizacion){
			precioVenta = nuevaCotizacion
		}	
	
		method depositar(pesos){
			saldo += pesos / precioVenta
		}
		
		method saldo(){
			return saldo * precioCompra
		}
		
		method extraer(pesos){
			saldo -= pesos / precioCompra
		}
}

object casa{
	var compras = 0
	var cuenta
	
	method compra(compra){
		compras += compra
		cuenta.extraer(compra)
	}
	
	method asignarCuenta(_cuenta){
		cuenta = _cuenta
	}
	
	method esDerrochona(){
		return	compras > 5000
	}
	
	method esBacan(){
		return cuenta.saldo() > 40000
	}
}

object cuentaCombinada{
	var cuentaPrimaria
	var cuentaSecundaria

		var saldo = 0
	
		method depositar(pesos){
			if(cuentaSecundaria.saldo() < 1000){
				cuentaSecundaria.depositar(pesos)	
			} else {
				cuentaPrimaria.depositar(pesos)
			}
			
		}
		
		method saldo(){
			return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
		}
		
		method extraer(pesos){
			saldo -= pesos
		}
		
		method asignarCuentaPrimaria(_cuenta){
			cuentaPrimaria = _cuenta
		}
		
		method asignarCuentaSecundaria(_cuenta){
			cuentaSecundaria = _cuenta
		}

}
