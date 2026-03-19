# V8 Authorization

## V8.1 Authorization Documentation

### v5.0.0-8.1.1 (L1)

Verify that authorization documentation defines rules for restricting function-level and data-specific access based on consumer permissions and resource attributes.

### v5.0.0-8.1.2 (L2)

Verify that authorization documentation defines rules for field-level access restrictions (both read and write) based on consumer permissions and resource attributes. Note that these rules might depend on other attribute values of the relevant data object, such as state or status.



## V8.2 General Authorization Design

### v5.0.0-8.2.1 (L1)

Verify that the application ensures that function-level access is restricted to consumers with explicit permissions.

### v5.0.0-8.2.2 (L1)

Verify that the application ensures that data-specific access is restricted to consumers with explicit permissions to specific data items to mitigate insecure direct object reference (IDOR) and broken object level authorization (BOLA).

### v5.0.0-8.2.3 (L2)

Verify that the application ensures that field-level access is restricted to consumers with explicit permissions to specific fields to mitigate broken object property level authorization (BOPLA).



## V8.3 Operation Level Authorization

### v5.0.0-8.3.1 (L1)

Verify that the application enforces authorization rules at a trusted service layer and doesn't rely on controls that an untrusted consumer could manipulate, such as client-side JavaScript.



## V8.4 Other Authorization Considerations

### v5.0.0-8.4.1 (L2)

Verify that multi-tenant applications use cross-tenant controls to ensure consumer operations will never affect tenants with which they do not have permissions to interact.


